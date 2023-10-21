package lpnu.fraud_detection.business;

import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud.detection.system.ValidationResult;

public interface TransactionValidator {
    ValidationResult validateTransaction(Transaction transaction);
}
