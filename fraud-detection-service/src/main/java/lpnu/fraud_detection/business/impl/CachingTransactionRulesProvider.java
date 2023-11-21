package lpnu.fraud_detection.business.impl;

import com.github.benmanes.caffeine.cache.Caffeine;
import com.github.benmanes.caffeine.cache.LoadingCache;
import lpnu.fraud.detection.system.RestrictionRule;
import lpnu.fraud_detection.business.TransactionRulesProvider;

import java.time.Duration;
import java.util.List;

public class CachingTransactionRulesProvider implements TransactionRulesProvider {
    private static final int IGNORED = -1;
    private static final int CACHE_SIZE = 1;
    private final LoadingCache<Integer, List<RestrictionRule>> cache;

    public CachingTransactionRulesProvider(
                TransactionRulesProvider transactionRulesProvider, 
                int cacheTTLSeconds) {
        cache = createCache(transactionRulesProvider, cacheTTLSeconds); // Extracted the cache creation logic into a separate method (createCache) to improve readability and maintainability.
    }
    
    // extracted createCache method
    private LoadingCache<Integer, List<RestrictionRule>> createCache(TransactionRulesProvider transactionRulesProvider, int cacheTTLSeconds) {
        return Caffeine.newBuilder()
                .expireAfterWrite(Duration.ofSeconds(cacheTTLSeconds))
                .maximumSize(CACHE_SIZE)
                .build(ignored -> transactionRulesProvider.getRules());
    }

    @Override
    public List<RestrictionRule> getRules() {
        return cache.get(IGNORED);
    }
}
