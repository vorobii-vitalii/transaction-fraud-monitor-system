package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.business.TransactionContextEvaluator;
import lpnu.fraud_detection.domain.TransactionContext;

public class TransactionContextEvaluatorImpl implements TransactionContextEvaluator {
    @Override
    public TransactionContext evaluateContext(Transaction transaction) {
        return TransactionContext.builder().transaction(transaction).build();
    }
}
