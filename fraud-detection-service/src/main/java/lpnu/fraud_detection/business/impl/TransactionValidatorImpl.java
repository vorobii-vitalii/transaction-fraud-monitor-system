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
                .map(this::buildBlockedValidationResult) // Extracted the logic for building a blocked validation result into a separate method (buildBlockedValidationResult) to improve readability and used method reference in the map operation to make the code more concise.
                .orElse(SUCCESS_VALIDATION);
    }

    //buildBlockedValidationResult method
    private ValidationResult buildBlockedValidationResult(String foundRule) {
        return ValidationResult.newBuilder()
                .setStatus(ValidationStatus.BLOCK)
                .setRuleName(foundRule)
                .build();
    }
}
