package lpnu.fraud_detection.domain;

import lombok.Builder;
import lpnu.fraud.detection.system.Transaction;

@Builder
public record TransactionContext(Transaction transaction) {
}
