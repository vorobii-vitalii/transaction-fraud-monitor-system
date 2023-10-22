package lpnu.fraud_detection;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import io.grpc.ServerBuilder;
import lpnu.fraud_detection.business.impl.CachingTransactionRulesProvider;
import lpnu.fraud_detection.business.impl.DatabaseTransactionRulesProvider;
import lpnu.fraud_detection.business.impl.EasyRulesTransactionRuleMatcher;
import lpnu.fraud_detection.business.impl.TransactionContextEvaluatorImpl;
import lpnu.fraud_detection.business.impl.TransactionValidatorImpl;
import lpnu.fraud_detection.dao.BankAccountsDAO;
import lpnu.fraud_detection.dao.RestrictionRulesDAO;
import lpnu.fraud_detection.grpc.GrpcRestrictionRulesServiceImpl;
import lpnu.fraud_detection.grpc.GrpcTransactionValidationServiceImpl;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import java.io.IOException;

public class FraudDetectionServer {

    public static void main(String[] args) throws IOException, InterruptedException {
        var dataSource = new HikariDataSource(getHikariConfig());
        var jdbi = Jdbi.create(dataSource);
        jdbi.installPlugin(new SqlObjectPlugin());
        var restrictionRulesDAO = jdbi.onDemand(RestrictionRulesDAO.class);
        var bankAccountDAO = jdbi.onDemand(BankAccountsDAO.class);
        var transactionRulesProvider = new CachingTransactionRulesProvider(
                new DatabaseTransactionRulesProvider(restrictionRulesDAO),
                Integer.parseInt(System.getenv("RULES_CACHE_TTL_SECONDS")));
        var transactionRuleMatcher = new EasyRulesTransactionRuleMatcher(
                transactionRulesProvider,
                new TransactionContextEvaluatorImpl(bankAccountDAO),
                Integer.parseInt(System.getenv("RULES_CACHE_TTL_SECONDS")));
        var transactionValidator = new TransactionValidatorImpl(transactionRuleMatcher);
        var server = ServerBuilder.forPort(Integer.parseInt(System.getenv("PORT")))
                .addService(new GrpcTransactionValidationServiceImpl(transactionValidator))
                .addService(new GrpcRestrictionRulesServiceImpl(restrictionRulesDAO))
                .build()
                .start();
        Runtime.getRuntime().addShutdownHook(new Thread(server::shutdown));
        server.awaitTermination();
    }

    private static HikariConfig getHikariConfig() {
        var config = new HikariConfig();
        config.setJdbcUrl(System.getenv("JDBC_URL"));
        config.setUsername(System.getenv("DB_USERNAME"));
        config.setPassword(System.getenv("DB_PASSWORD"));
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        return config;
    }

}
