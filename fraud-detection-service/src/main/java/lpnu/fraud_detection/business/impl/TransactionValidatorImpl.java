package lpnu.fraud_detection.business.impl;

import lombok.RequiredArgsConstructor;
import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud.detection.system.ValidationResult;
import lpnu.fraud.detection.system.ValidationStatus;
import lpnu.fraud_detection.business.TransactionRuleMatcher;
import lpnu.fraud_detection.business.TransactionValidator;

@RequiredArgsConstructor
public class TransactionValidatorImpl implements TransactionValidator {
    private static final ValidationResult SUCCESS_VALIDATION =
            ValidationResult.newBuilder().setStatus(ValidationStatus.SUCCESS).build();

    private final TransactionRuleMatcher transactionRuleMatcher;

    @Override
    public ValidationResult validateTransaction(Transaction transaction) {
        return transactionRuleMatcher.findMatchedTransactionRule(transaction)
                .map(foundRule -> ValidationResult.newBuilder()
                        .setStatus(ValidationStatus.BLOCK)
                        .setRuleName(foundRule)
                        .build())
                .orElse(SUCCESS_VALIDATION);
    }
}
