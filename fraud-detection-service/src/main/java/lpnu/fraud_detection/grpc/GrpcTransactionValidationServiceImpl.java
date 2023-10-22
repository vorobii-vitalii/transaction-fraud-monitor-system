package lpnu.fraud_detection.grpc;

import io.grpc.stub.StreamObserver;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud.detection.system.TransactionValidationServiceGrpc;
import lpnu.fraud.detection.system.ValidationResult;
import lpnu.fraud_detection.business.TransactionValidator;

@RequiredArgsConstructor
@Slf4j
public class GrpcTransactionValidationServiceImpl extends TransactionValidationServiceGrpc.TransactionValidationServiceImplBase {
    private final TransactionValidator transactionValidator;
    @Override
    public void validateTransaction(Transaction transaction, StreamObserver<ValidationResult> responseObserver) {
        log.info("Received request to validate transaction {}", transaction);
        try {
            var validationResult = transactionValidator.validateTransaction(transaction);
            responseObserver.onNext(validationResult);
            responseObserver.onCompleted();
        } catch (Exception e) {
            log.error("Error occurred on validation of transaction", e);
            responseObserver.onError(e);
        }
    }
}
