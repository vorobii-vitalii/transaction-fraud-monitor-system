package lpnu.fraud_detection.business;

import lpnu.fraud.detection.system.Transaction;

import java.util.Optional;

public interface TransactionRuleMatcher {
    Optional<String> findMatchedTransactionRule(Transaction transaction);
}
