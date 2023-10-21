package lpnu.fraud_detection.business.impl;

import com.github.benmanes.caffeine.cache.Caffeine;
import com.github.benmanes.caffeine.cache.LoadingCache;
import lpnu.fraud.detection.system.Transaction;
import lpnu.fraud_detection.business.TransactionContextEvaluator;
import lpnu.fraud_detection.business.TransactionRuleMatcher;
import lpnu.fraud_detection.business.TransactionRulesProvider;
import org.jeasy.rules.api.Facts;
import org.jeasy.rules.api.Rule;
import org.jeasy.rules.api.RuleListener;
import org.jeasy.rules.api.Rules;
import org.jeasy.rules.core.DefaultRulesEngine;
import org.jeasy.rules.mvel.MVELRule;

import java.time.Duration;
import java.util.Optional;

public class EasyRulesTransactionRuleMatcher implements TransactionRuleMatcher {
    private static final String FACTS = "facts";
    private static final String RESULT = "result";
    private static final String CONTEXT = "context";
    public static final long MAXIMUM_SIZE = 1L;
    public static final int IGNORED_KEY = 1;

    private final TransactionContextEvaluator transactionContextEvaluator;
    private final LoadingCache<Integer, Rules> rulesCache;

    public EasyRulesTransactionRuleMatcher(
            TransactionRulesProvider transactionRulesProvider,
            TransactionContextEvaluator transactionContextEvaluator,
            int cacheTTLSeconds
    ) {
        this.transactionContextEvaluator = transactionContextEvaluator;
        rulesCache = Caffeine.newBuilder()
                .maximumSize(MAXIMUM_SIZE)
                .expireAfterWrite(Duration.ofSeconds(cacheTTLSeconds))
                .build(ignored -> {
                    var rules = new Rules();
                    transactionRulesProvider
                            .getRules()
                            .forEach(rule -> {
                                var ruleName = rule.getRuleName();
                                rules.register(new MVELRule()
                                        .name(ruleName)
                                        .description(ruleName)
                                        .when(rule.getPredicate())
                                        .then(FACTS + ".put(\"" + RESULT + "\", \"" + ruleName + "\");"));
                            });
                    return rules;
                });
    }

    @Override
    public Optional<String> findMatchedTransactionRule(Transaction transaction) {
        var context = transactionContextEvaluator.evaluateContext(transaction);
        var facts = new Facts();
        facts.put(CONTEXT, context);
        var rules = rulesCache.get(IGNORED_KEY);
        var rulesEngine = new DefaultRulesEngine();
        rulesEngine.registerRuleListener(new RuleListener() {
            @Override
            public void beforeExecute(Rule rule, Facts facts) {
                facts.put(FACTS, facts);
            }

            @Override
            public void onSuccess(Rule rule, Facts facts) {
                facts.remove(FACTS);
            }

            @Override
            public void onFailure(Rule rule, Facts facts, Exception exception) {
                facts.remove(FACTS);
            }
        });
        rulesEngine.fire(rules, facts);
        return Optional.ofNullable(facts.get(RESULT));
    }
}
