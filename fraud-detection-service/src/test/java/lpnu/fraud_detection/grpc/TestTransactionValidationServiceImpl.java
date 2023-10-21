package lpnu.fraud_detection.grpc;

import io.grpc.stub.StreamObserver;
import lpnu.fraud.detection.system.Amount;
import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud.detection.system.ValidationResult;
import lpnu.fraud.detection.system.ValidationStatus;
import lpnu.fraud_detection.business.TransactionValidator;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class TestTransactionValidationServiceImpl {

    @InjectMocks
    GrpcTransactionValidationServiceImpl grpcTransactionValidationService;

    @Mock
    TransactionValidator transactionValidator;

    @Mock
    StreamObserver<ValidationResult> responseObserver;

    @Test
    void validateTransactionHappyPath() {
        var transaction = Transaction.newBuilder()
                .setFromAccount("1")
                .setToAccount("2")
                .setAmount(Amount.newBuilder().setAmount(20).setCurrency("USD").build())
                .setCountry("USA")
                .build();
        var validationResult =
                ValidationResult.newBuilder().setStatus(ValidationStatus.BLOCK).build();
        when(transactionValidator.validateTransaction(transaction)).thenReturn(validationResult);
        grpcTransactionValidationService.validateTransaction(transaction, responseObserver);
        var inOrder = Mockito.inOrder(responseObserver);
        inOrder.verify(responseObserver).onNext(validationResult);
        inOrder.verify(responseObserver).onCompleted();
    }

    @Test
    void validateTransactionFailureCase() {
        var transaction = Transaction.newBuilder()
                .setFromAccount("1")
                .setToAccount("2")
                .setAmount(Amount.newBuilder().setAmount(20).setCurrency("USD").build())
                .setCountry("USA")
                .build();
        var error = new RuntimeException();
        when(transactionValidator.validateTransaction(transaction))
                .thenThrow(error);
        grpcTransactionValidationService.validateTransaction(transaction, responseObserver);
        verify(responseObserver).onError(error);
    }

}
