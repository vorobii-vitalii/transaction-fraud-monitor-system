package lpnu.fraud_detection.mapper;

import lpnu.fraud.detection.system.RestrictionRule;
import org.jdbi.v3.core.statement.StatementContext;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.ResultSet;
import java.sql.SQLException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class RestrictionRuleMapperTest {
    private static final String ID = "ID";
    private static final String PREDICATE = "PREDICATE";
    private static final String RULE_NAME = "RULE_NAME";

    @InjectMocks
    RestrictionRuleMapper mapper;

    @Mock
    ResultSet resultSet;

    @Mock
    StatementContext statementContext;

    @Test
    void map() throws SQLException {
        when(resultSet.getString(ID)).thenReturn("1");
        when(resultSet.getString(PREDICATE)).thenReturn("x = 1");
        when(resultSet.getString(RULE_NAME)).thenReturn("Rule 1");
        assertThat(mapper.map(resultSet, statementContext))
                .isEqualTo(RestrictionRule.newBuilder()
                        .setId("1")
                        .setRuleName("Rule 1")
                        .setPredicate("x = 1")
                        .build());
    }
}