package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.Amount;
import lpnu.fraud.detection.system.RestrictionRule;
import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.business.TransactionContextEvaluator;
import lpnu.fraud_detection.business.TransactionRulesProvider;
import lpnu.fraud_detection.domain.TransactionContext;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class EasyRulesRestrictionRuleMatcherTest {

    public static final int CACHE_TTL_SECONDS = 100;
    @Mock
    TransactionRulesProvider transactionRulesProvider;

    @Mock
    TransactionContextEvaluator transactionContextEvaluator;

    @Test
    void findMatchedTransactionRuleNoneRuleMatched() {
        var transaction = Transaction.newBuilder()
                .setAmount(Amount.newBuilder().setAmount(150).setCurrency("USD").build())
                .build();
        when(transactionContextEvaluator.evaluateContext(transaction))
                .thenReturn(TransactionContext.builder()
                        .transaction(transaction)
                        .build());
        when(transactionRulesProvider.getRules()).thenReturn(List.of(
                RestrictionRule.newBuilder()
                        .setId("1")
                        .setRuleName("Rule 1")
                        .setPredicate("context.transaction.getAmount().getAmount() > 500")
                        .build(),
                RestrictionRule.newBuilder()
                        .setId("1")
                        .setRuleName("Rule 2")
                        .setPredicate("context.transaction.getAmount().getCurrency() == 'RUB'")
                        .build()
        ));
        assertThat(new EasyRulesTransactionRuleMatcher(transactionRulesProvider, transactionContextEvaluator, CACHE_TTL_SECONDS)
                .findMatchedTransactionRule(transaction)).isEmpty();
    }

    @Test
    void findMatchedTransactionRuleGivenOneOfRulesMatched() {
        var transaction = Transaction.newBuilder()
                .setAmount(Amount.newBuilder().setAmount(600).setCurrency("USD").build())
                .build();
        when(transactionContextEvaluator.evaluateContext(transaction))
                .thenReturn(TransactionContext.builder()
                        .transaction(transaction)
                        .build());
        when(transactionRulesProvider.getRules()).thenReturn(List.of(
                RestrictionRule.newBuilder()
                        .setId("1")
                        .setRuleName("Rule 1")
                        .setPredicate("context.transaction.getAmount().getAmount() > 500")
                        .build(),
                RestrictionRule.newBuilder()
                        .setId("1")
                        .setRuleName("Rule 2")
                        .setPredicate("context.transaction.getAmount().getCurrency() == 'RUB'")
                        .build()
        ));
        assertThat(new EasyRulesTransactionRuleMatcher(transactionRulesProvider, transactionContextEvaluator, CACHE_TTL_SECONDS)
                .findMatchedTransactionRule(transaction)).contains("Rule 1");
    }

}