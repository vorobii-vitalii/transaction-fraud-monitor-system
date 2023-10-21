package lpnu.fraud_detection.business;

import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.domain.TransactionContext;

public interface TransactionContextEvaluator {
    TransactionContext evaluateContext(Transaction transaction);
}
