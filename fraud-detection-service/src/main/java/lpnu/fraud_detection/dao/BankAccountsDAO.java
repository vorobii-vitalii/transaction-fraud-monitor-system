package lpnu.fraud_detection.dao;

import lpnu.fraud_detection.domain.BankAccount;
import lpnu.fraud_detection.mapper.BankAccountMapper;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.Optional;

public interface BankAccountsDAO {
    @SqlQuery("SELECT ID, COUNTRY FROM BANK_ACCOUNT WHERE ID = ?")
    @RegisterRowMapper(BankAccountMapper.class)
    Optional<BankAccount> getAccountById(@Bind("ID") String accountId);
}
