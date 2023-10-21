package lpnu.fraud_detection.dao;

import lpnu.fraud.detection.system.RestrictionRule;
import lpnu.fraud_detection.mapper.RestrictionRuleMapper;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

public interface RestrictionRulesDAO {

    @SqlQuery("SELECT ID, RULE_NAME, PREDICATE FROM restriction_rules")
    @RegisterRowMapper(RestrictionRuleMapper.class)
    List<RestrictionRule> getAllRestrictionRules();

    @SqlUpdate("DELETE FROM restriction_rules WHERE ID = ?")
    void removeRestrictionRule(@Bind("ID") String ruleId);

    @SqlUpdate("INSERT INTO restriction_rules (ID, RULE_NAME, PREDICATE) VALUES (?, ?, ?)")
    void insertRestrictionRule(@Bind("ID") String id, @Bind("RULE_NAME") String name, @Bind("PREDICATE") String predicate);
}
