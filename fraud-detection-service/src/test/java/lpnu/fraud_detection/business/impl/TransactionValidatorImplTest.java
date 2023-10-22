package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud.detection.system.ValidationResult;
import lpnu.fraud.detection.system.ValidationStatus;
import lpnu.fraud_detection.business.TransactionRuleMatcher;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class TransactionValidatorImplTest {
    private static final Transaction TRANSACTION = Transaction.newBuilder().build();
    private static final String RULE_NAME = "rule_name";

    @Mock
    TransactionRuleMatcher transactionRuleMatcher;

    @InjectMocks
    TransactionValidatorImpl transactionValidator;

    @Test
    void validateTransactionNoRuleMatched() {
        when(transactionRuleMatcher.findMatchedTransactionRule(TRANSACTION))
                .thenReturn(Optional.empty());
        assertThat(transactionValidator.validateTransaction(TRANSACTION))
                .isEqualTo(ValidationResult.newBuilder().setStatus(ValidationStatus.SUCCESS).build());
    }

    @Test
    void validateTransactionSomeRuleMatched() {
        when(transactionRuleMatcher.findMatchedTransactionRule(TRANSACTION))
                .thenReturn(Optional.of(RULE_NAME));
        assertThat(transactionValidator.validateTransaction(TRANSACTION))
                .isEqualTo(ValidationResult.newBuilder()
                        .setStatus(ValidationStatus.BLOCK)
                        .setRuleName(RULE_NAME)
                        .build());
    }

}
