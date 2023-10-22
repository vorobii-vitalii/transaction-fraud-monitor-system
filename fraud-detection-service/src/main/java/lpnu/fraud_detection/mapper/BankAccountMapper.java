package lpnu.fraud_detection.mapper;

import lpnu.fraud_detection.domain.BankAccount;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BankAccountMapper implements RowMapper<BankAccount> {
    private static final String ACCOUNT_ID = "ID";
    private static final String ACCOUNT_COUNTRY = "COUNTRY";

    @Override
    public BankAccount map(ResultSet rs, StatementContext ctx) throws SQLException {
        return BankAccount.builder()
                .accountId(rs.getString(ACCOUNT_ID))
                .country(rs.getString(ACCOUNT_COUNTRY))
                .build();
    }
}
