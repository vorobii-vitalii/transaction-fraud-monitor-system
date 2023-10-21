package lpnu.fraud_detection.business;

import lpnu.fraud.detection.system.RestrictionRule;

import java.util.List;

public interface TransactionRulesProvider {
    List<RestrictionRule> getRules();
}
