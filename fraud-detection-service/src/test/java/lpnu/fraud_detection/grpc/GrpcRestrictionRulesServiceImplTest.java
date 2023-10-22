package lpnu.fraud_detection.grpc;

import io.grpc.stub.StreamObserver;
import lpnu.fraud.detection.system.*;
import lpnu.fraud_detection.dao.RestrictionRulesDAO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class GrpcRestrictionRulesServiceImplTest {
    private static final String ID = "124";
    private static final String RULE_NAME = "Rule name";
    private static final String PREDICATE = "x = 2";
    private static final Empty EMPTY = Empty.newBuilder().build();

    @Mock
    RestrictionRulesDAO restrictionRulesDAO;

    @InjectMocks
    GrpcRestrictionRulesServiceImpl restrictionRulesService;

    @Mock
    StreamObserver<Empty> emptyStreamObserver;

    @Mock
    StreamObserver<RestrictionRules> restrictionRulesStreamObserver;

    @Test
    void createNewRestrictionRuleHappyPath() {
        var createNewRestrictionRule = CreateNewRestrictionRule.newBuilder()
                .setId(ID)
                .setName(RULE_NAME)
                .setPredicate(PREDICATE)
                .build();
        restrictionRulesService.createNewRestrictionRule(createNewRestrictionRule, emptyStreamObserver);
        verify(restrictionRulesDAO).insertRestrictionRule(ID, RULE_NAME, PREDICATE);
        verify(emptyStreamObserver).onNext(EMPTY);
        verify(emptyStreamObserver).onCompleted();
    }

    @Test
    void createNewRestrictionRuleFailureCase() {
        var createNewRestrictionRule = CreateNewRestrictionRule.newBuilder()
                .setId(ID)
                .setName(RULE_NAME)
                .setPredicate(PREDICATE)
                .build();
        var error = new RuntimeException();
        doThrow(error)
                .when(restrictionRulesDAO)
                .insertRestrictionRule(ID, RULE_NAME, PREDICATE);
        restrictionRulesService.createNewRestrictionRule(createNewRestrictionRule, emptyStreamObserver);
        verify(emptyStreamObserver).onError(error);
    }

    @Test
    void removeRestrictionRuleHappyPath() {
        var removeRestrictionRule = RemoveRestrictionRule.newBuilder().setId(ID).build();
        restrictionRulesService.removeRestrictionRule(removeRestrictionRule, emptyStreamObserver);
        verify(restrictionRulesDAO).removeRestrictionRule(ID);
        verify(emptyStreamObserver).onNext(EMPTY);
        verify(emptyStreamObserver).onCompleted();
    }

    @Test
    void getRestrictionRules() {
        var restrictionRules = List.of(RestrictionRule.newBuilder().build());
        when(restrictionRulesDAO.getAllRestrictionRules())
                .thenReturn(restrictionRules);
        restrictionRulesService.getRestrictionRules(EMPTY, restrictionRulesStreamObserver);
        verify(restrictionRulesStreamObserver).onNext(RestrictionRules.newBuilder()
                .addAllRule(restrictionRules)
                .build());
    }

}
