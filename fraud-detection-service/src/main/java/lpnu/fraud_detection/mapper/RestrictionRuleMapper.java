package lpnu.fraud_detection.mapper;

import lpnu.fraud.detection.system.RestrictionRule;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RestrictionRuleMapper implements RowMapper<RestrictionRule> {
    private static final String ID = "ID";
    private static final String PREDICATE = "PREDICATE";
    private static final String RULE_NAME = "RULE_NAME";

    @Override
    public RestrictionRule map(ResultSet rs, StatementContext ctx) throws SQLException {
        return RestrictionRule.newBuilder()
                .setId(rs.getString(ID))
                .setPredicate(rs.getString(PREDICATE))
                .setRuleName(rs.getString(RULE_NAME))
                .build();
    }
}
