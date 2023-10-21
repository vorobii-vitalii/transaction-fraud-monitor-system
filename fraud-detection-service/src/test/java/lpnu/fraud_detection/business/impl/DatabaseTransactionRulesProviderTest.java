package lpnu.fraud_detection.business.impl;

import lpnu.fraud.detection.system.RestrictionRule;
import lpnu.fraud_detection.dao.RestrictionRulesDAO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class DatabaseTransactionRulesProviderTest {

    @Mock
    RestrictionRulesDAO restrictionRulesDAO;

    @InjectMocks
    DatabaseTransactionRulesProvider databaseTransactionRulesProvider;

    @Test
    void getRules() {
        var restrictionRules =
                List.of(RestrictionRule.newBuilder().build());
        when(restrictionRulesDAO.getAllRestrictionRules()).thenReturn(restrictionRules);
        assertThat(databaseTransactionRulesProvider.getRules()).isEqualTo(restrictionRules);
    }
}
