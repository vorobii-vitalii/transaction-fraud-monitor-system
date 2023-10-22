package lpnu.fraud_detection.domain;

import lombok.Builder;

@Builder
public record BankAccount(String accountId, String country) {
}
