package lpnu.fraud_detection.business.impl;

import lombok.RequiredArgsConstructor;
import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.business.TransactionContextEvaluator;
import lpnu.fraud_detection.dao.BankAccountsDAO;
import lpnu.fraud_detection.domain.TransactionContext;

@RequiredArgsConstructor
public class TransactionContextEvaluatorImpl implements TransactionContextEvaluator {
    private final BankAccountsDAO bankAccountsDAO;

    @Override
    public TransactionContext evaluateContext(Transaction transaction) {
        return TransactionContext.builder()
                .transaction(transaction)
                .fromAccount(bankAccountsDAO.getAccountById(transaction.getFromAccount()).orElse(null))
                .toAccount(bankAccountsDAO.getAccountById(transaction.getToAccount()).orElse(null))
                .build();
    }
}
