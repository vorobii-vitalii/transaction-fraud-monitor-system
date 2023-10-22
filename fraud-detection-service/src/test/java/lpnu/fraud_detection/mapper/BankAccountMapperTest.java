package lpnu.fraud_detection.mapper;

import lpnu.fraud_detection.domain.BankAccount;
import org.jdbi.v3.core.statement.StatementContext;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.ResultSet;
import java.sql.SQLException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class BankAccountMapperTest {
    private static final String ACCOUNT_ID = "ID";
    private static final String ACCOUNT_COUNTRY = "COUNTRY";

    @InjectMocks
    BankAccountMapper mapper;

    @Mock
    ResultSet resultSet;

    @Mock
    StatementContext statementContext;

    @Test
    void map() throws SQLException {
        when(resultSet.getString(ACCOUNT_ID)).thenReturn("1");
        when(resultSet.getString(ACCOUNT_COUNTRY)).thenReturn("USA");
        assertThat(mapper.map(resultSet, statementContext))
                .isEqualTo(BankAccount.builder().accountId("1").country("USA").build());
    }

}
