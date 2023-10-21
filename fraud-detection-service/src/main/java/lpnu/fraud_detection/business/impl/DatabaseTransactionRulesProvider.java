package lpnu.fraud_detection.business.impl;

import lombok.RequiredArgsConstructor;
import lpnu.fraud.detection.system.RestrictionRule;
import lpnu.fraud_detection.business.TransactionRulesProvider;
import lpnu.fraud_detection.dao.RestrictionRulesDAO;

import java.util.List;

@RequiredArgsConstructor
public class DatabaseTransactionRulesProvider implements TransactionRulesProvider {
    private final RestrictionRulesDAO restrictionRulesDAO;

    @Override
    public List<RestrictionRule> getRules() {
        return restrictionRulesDAO.getAllRestrictionRules();
    }
}
