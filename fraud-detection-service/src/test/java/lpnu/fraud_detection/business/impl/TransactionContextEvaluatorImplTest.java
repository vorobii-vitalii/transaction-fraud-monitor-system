package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.dao.BankAccountsDAO;
import lpnu.fraud_detection.domain.BankAccount;
import lpnu.fraud_detection.domain.TransactionContext;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class TransactionContextEvaluatorImplTest {

    public static final String FROM_ACCOUNT = "1";
    public static final String TO_ACCOUNT = "2";
    @Mock
    BankAccountsDAO bankAccountsDAO;

    @InjectMocks
    TransactionContextEvaluatorImpl transactionContextEvaluator;

    @Test
    void evaluateContext() {
        var transaction = Transaction.newBuilder()
                .setFromAccount(FROM_ACCOUNT)
                .setToAccount(TO_ACCOUNT)
                .build();
        var fromAccount = BankAccount.builder().accountId(FROM_ACCOUNT).build();
        var toAccount = BankAccount.builder().accountId(TO_ACCOUNT).build();
        when(bankAccountsDAO.getAccountById(FROM_ACCOUNT))
                .thenReturn(Optional.of(fromAccount));
        when(bankAccountsDAO.getAccountById(TO_ACCOUNT))
                .thenReturn(Optional.of(toAccount));
        assertThat(transactionContextEvaluator.evaluateContext(transaction))
                .isEqualTo(TransactionContext.builder()
                        .transaction(transaction)
                        .fromAccount(fromAccount)
                        .toAccount(toAccount)
                        .build());
    }
}