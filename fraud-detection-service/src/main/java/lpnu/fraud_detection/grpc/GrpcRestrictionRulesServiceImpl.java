package lpnu.fraud_detection.grpc;

import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lpnu.fraud.detection.system.*;
import lpnu.fraud_detection.dao.RestrictionRulesDAO;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
public class GrpcRestrictionRulesServiceImpl extends RestrictionRulesServiceGrpc.RestrictionRulesServiceImplBase {
    public static final Empty EMPTY = Empty.newBuilder().build();
    private final RestrictionRulesDAO restrictionRulesDAO;

    @Override
    public void createNewRestrictionRule(CreateNewRestrictionRule request, StreamObserver<Empty> responseObserver) {
        log.info("Received request to create new restriction rule {}", request);
        try {
            restrictionRulesDAO.insertRestrictionRule(request.getId(), request.getName(), request.getPredicate());
            responseObserver.onNext(EMPTY);
            responseObserver.onCompleted();
        } catch (Exception exception) {
            log.error("Error occurred on creation of new rule", exception);
            responseObserver.onError(exception);
        }
    }

    @Override
    public void removeRestrictionRule(RemoveRestrictionRule request, StreamObserver<Empty> responseObserver) {
        log.info("Received request to remove restriction rule {}", request);
        try {
            restrictionRulesDAO.removeRestrictionRule(request.getId());
            responseObserver.onNext(EMPTY);
            responseObserver.onCompleted();
        } catch (Exception exception) {
            log.error("Error occurred on deletion of rule", exception);
            responseObserver.onError(exception);
        }
    }

    @Override
    public void getRestrictionRules(Empty request, StreamObserver<RestrictionRules> responseObserver) {
        log.info("Received request to get all restriction rules {}", request);
        try {
            var restrictionRules = restrictionRulesDAO.getAllRestrictionRules();
            responseObserver.onNext(RestrictionRules.newBuilder().addAllRule(restrictionRules).build());
            responseObserver.onCompleted();
        } catch (Exception exception) {
            log.error("Error occurred on fetch of restriction rules", exception);
            responseObserver.onError(exception);
        }
    }
}
