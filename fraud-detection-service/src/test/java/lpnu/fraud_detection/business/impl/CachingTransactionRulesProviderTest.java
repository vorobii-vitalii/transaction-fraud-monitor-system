package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.RestrictionRule;
import lpnu.fraud_detection.business.TransactionRulesProvider;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class CachingTransactionRulesProviderTest {
    private static final int TTL = 100;
    private static final List<RestrictionRule> RESTRICTION_RULES =
            List.of(RestrictionRule.newBuilder().build());

    @Mock
    TransactionRulesProvider transactionRulesProvider;

    CachingTransactionRulesProvider cachingTransactionRulesProvider;

    @BeforeEach
    void init() {
        cachingTransactionRulesProvider = new CachingTransactionRulesProvider(transactionRulesProvider, TTL);
    }

    @Test
    void getRules() {
        when(transactionRulesProvider.getRules()).thenReturn(RESTRICTION_RULES);
        var rules1 = cachingTransactionRulesProvider.getRules();
        var rules2 = cachingTransactionRulesProvider.getRules();
        assertThat(rules1).isEqualTo(RESTRICTION_RULES);
        assertThat(rules2).isEqualTo(RESTRICTION_RULES);
        verify(transactionRulesProvider, times(1)).getRules();
    }
}
