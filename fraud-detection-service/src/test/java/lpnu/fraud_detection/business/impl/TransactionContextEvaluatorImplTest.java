package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.domain.TransactionContext;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;

@ExtendWith(MockitoExtension.class)
class TransactionContextEvaluatorImplTest {

    @InjectMocks
    TransactionContextEvaluatorImpl transactionContextEvaluator;

    @Test
    void evaluateContext() {
        var transaction = Transaction.newBuilder().build();
        assertThat(transactionContextEvaluator.evaluateContext(transaction))
                .isEqualTo(TransactionContext.builder().transaction(transaction).build());
    }
}