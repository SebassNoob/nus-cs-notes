#set text(lang: "en", region: "GB")
= Getting Data
PPDAC cycle: 
1. Problem
2. Plan
3. Data


== Variables
An attribute that can be measured or labelled.

1. Independent variable: may be subject to manipulation
2. Dependent variable: hypothesised to change

=== Variable classification
Needed to lead to correct visualisation tools (graphs)

1. Categorical Variable: like an enum type, each observation can be placed in 1 label
  - Ordinal: Natural ordering (usually with numbers, NOT numerical variable) 
  - Nominal: No natural ordering
2. Numerical Variable: like a number, manipulate with arithmetics
  - Discrete
  - Continuous


#linebreak()

== Sampling

Goals: to minimise bias and error.

=== Sample, Census, Population
- Sample: Sample is a proportion of population selected in the study. 
- Census: Census is attempt to reach out to whole population.
- Population: Entire group of objects the researcher is interested in.

=== Sampling frame
A list of the items or people forming a population from which a sample is taken.

For example, investigating Singapore residents: take sampling frame to be hand phone numbers.

Goal: Sampling frame >= target population (generalisability -> sample is a good estimate of the population parameter; removes selection bias)

Issues:
1. Some residents may not have hand phone numbers (insufficient coverage)
2. Some residents may have > 1 hand phone number (redundant data)


=== Bias
1. Selection Bias
  - Imperfect sampling frame: Parts of the population left out of the frame
  - Non-probability sampling: Omits chance in the selection of individuals (eg. arbitrarily selecting only women in a sample instead of randomly selecting)
2. Non-Response Bias
Non-disclosure of information toward the study due to reasons.
  - Not interested
  - Inconvenient
  - Sensitive info

=== Probability, Non-probability sampling
- Probability: each unit has a known non zero chance of being selected (removes selection bias)
- Non-probability: not all units have a chance to be selected

=== Sampling methods
1. Simple random sampling
2. Stratified sampling: choose every $n$th unit 
3. Stratified random sampling: divide into subgroups, perform random sampling on each subgroup. include selected units of subgroups in final sample
4. Cluster sampling: divide into subgroups, take random sample of subgroups. include all units of selected subgroups in final sample



#linebreak()
  
== Summary Statistics

1. Measures of central tendency
  - Mean
  - Median
  - Mode
2. Measures of Dispersion
  - Standard deviation
  - Inter-quartile range

=== Standard deviation and Variance
Sample variance: $\V\a\r(x) = 1/(n-1) sum^n_(i=1) (x_i - overline(x))^2$ 

Sample s.d.: $s_x =sqrt(\V\a\r(x))$ (stdev.s in excel)

Coefficient of variation: $(s_x)/overline(x)$

Median: middle value (if even numbered, take average of central values)

Inter-quartile range: $Q_1-Q_3$

=== Marginal,
- marginal rate: (1 variable only, X) ratio of X and the overall population
- conditional rate: (2 variables, X | Y) the ratio of X and the overall population (taken as satisfying the condition Y)
- joint rate: (2 variables, X & Y) ratio where all the subjects considered the population (X & Y)

#linebreak()

== Study designs

=== Experimental studies
Manipulate independent variable to induce change in dependent variable. 1 treatment group, 1 control group. Shows cause and effect. Apply techniques:
- Random assignment: an impartial procedure that uses chance (to account for uncontrollable constants like age, sex, IQ, etc)
- Blinding: use a placebo to account for bias. 
  - Blinded subjects do not know whether they are in the control or treatment group.
  - Blinded researchers do not know if the subject they are researching is in the control or treatment group. 
  - Double blind if both subjects and researchers are blinded

=== Observational studies
Researchers do not attempt to manipulate 1 variable to cause change in dependent variable. does not show cause or effect, instead shows association. used for ethical purposes. 

example: is long term smoking linked to heart disease? 
- Researchers should not force people to smoke
- They just observe the 'treatment' (those who smoke) and 'control' (those who don't smoke) groups.



= Categorical data analysis

== Data representation
- Bar plots (can be percentage based)
  - Stacked (categorical groups are stacked atop each other to 100%)
  - Dodged (groups are placed beside each other)
- 2x2 table (binary outcomes + treatment + control, includes row and column totals)

== Association between categorical variables
Assume A and B are characteristics of a population. $\r\a\t\e(X)$ is the % of the population for which X is satisfied. If:
- $\r\a\t\e(A | B) = \r\a\t\e(A | not B)$: A is *not associated* with B. (rate is the same regardless of presence of B)
- $\r\a\t\e(A | B) > \r\a\t\e(A | not B)$: A has a *positive association* with B. (A and B together cause the rate to increase)
- $\r\a\t\e(A | B) < \r\a\t\e(A | not B)$: A has a *negative association* with B.

=== Example
Outcome of treatment:
- $A$: success
- $not A$: failure
Treatment:
- $B$: Treatment X
- $not B$: Treatment Y

$\r\a\t\e(A | B) < \r\a\t\e(A | not B)$ means treatment X has a negative association with success and treatment Y has a positive association with success.

== Rule on rates
=== Symmetry rule
$\r\a\t\e(A | B) circle \r\a\t\e(A | not B) ⟺ \r\a\t\e(B | A) circle \r\a\t\e(B | not A)$ where $circle in {=, <, >}$

This gives results:
1. As $\r\a\t\e(B) -> 100%$, $\r\a\t\e(A | B) -> \r\a\t\e(A)$
2. $\r\a\t\e(B) = 50% => \r\a\t\e(A) = (\r\a\t\e(A | B) + \r\a\t\e(A | not B))/2$
3. $\r\a\t\e(A | B) = \r\a\t\e(A | not B) => \r\a\t\e(A) = \r\a\t\e(A | B) = \r\a\t\e(A | not B)$

=== Basic rule
The $\r\a\t\e(A)$ is always between subgroup rates $\r\a\t\e(A | B)$ and $\r\a\t\e(A | C)$.

== Simpson's paradox
A trend appears in the majority of several groups of data, but disappears/reverses when the group is combined together. 

Use slicing to split by categorical groups, and use rules of rates to analyze. If sliced too many times, sample becomes inaccurate representation of population as it is too thin.

Eg. A doctor who treats more minor injuries than major injuries is likely to have a overall success rate than a doctor who does the other way around. But this may not be the case when splitting success rates between minor from major injuries.

=== Confounding variable
A third variable with an association with the dependant *and* independent variable.

Show confounding variable's existence by proving $\r\a\t\e(C | X) != \r\a\t\e(C | not X)$.

Cannot possibly account for all confounders in an observational study. Hence association and not causation.

Correct for confounders in experimental studies with random assignment.

Presence of Confounders != presence of Simpson's paradox BUT presence of Simpson's paradox === presence of confounders


= Dealing with numerical data

== Univariate exploratory data analysis (EDA)

Describe: shape, centre, spread, outliers
- frequency table
- histogram: divide data into 'bins' (segments, eg 1-2, 3-4, 5-6)
  - Unimodal/Multimodal: 1 peak/many peaks in the data
  - Symmetrical/(L/R)-skewed: Peak is in the centre/skewed to the left or right
  - Mean, median, mode: Positions depend on skew, R: mean < median < mode; L: mode < median < mean
  - Variability (s.d., range of data)
- box plot: draw a box from Q1 to Q3 + median, with whiskers from Q1 - 1.5 \* IQR to  Q3 + 1.5 \* IQR 
  - 5-number summary: Q0-Q4
  - outliers (indicate with dots): data points which are 
    1. greater than Q3 + 1.5 \* IQR
    2. less than Q1 - 1.5 \* IQR
      
== Bivariate EDA

Deterministic relationship: where the dependent variable can be directly calculated from the independent variable

- Scatter plots
  - ordered pair (x,y) to scatter points on a graph
  - relationship: positive, negative, NA
  - form: linear, non-linear
  - strength of relationship: strong (points follow relationship closely) vs weak (vice-versa)
- Correlation coefficients
- Regression analysis

== Linear regression
- Corelation coefficient $r$, $-1<=r<=1$
  - sign of r: positive/negative linear association
  - magnitude of r: strength of linear association
  - $"standard unit (SU)" = (x-overline(x))/s_x$
  - $r = 1/(n-1) sum ((x-overline(x))/s_x) ((y-overline(y))/s_y)$
  - not affected by:
    1. switching of x and y
    2. adding constant to x or y
    3. multiplying by positive constant
- ecological correlation: aggregate data points into groups, analyse regression separately
  - ecological fallacy: the mistake of assuming that characteristics or relationships observed at a group level (like average scores for a city) also apply to individuals within that group. may yield wildly different r values.
  - atomistic fallacy:  inferences about a higher-level unit (such as a group) are made based on data collected at a lower level (such as individuals). Opposite of ecological fallacy
- normalisation: $Y=\mX+b$, take r value with highest magnitude.

= Probability
- *Probability experiment*: MUST be
  1. repeatable
  2. give rise to a precise set of outcomes
- *Sample space*: collection of all outcomes
- *Event*: subcollection of sample space (outcome is an event)
- *uniform probability*: every outcome has same probability

$P(A|B)$ = $"rate"(A|B)$ (but rates do not involve random processes, rate is the actual result)

Independent events: $P(A) times P(B) = P(A inter B)$ (the occurrence of 1 event does not change the likelihood of the other event)

Mutually exclusive events: $P(A union B) = P(A) + P(B)$

Law of total probability: total probability of an event (A) can be found by summing the probabilities of (A) occurring within each of a set of mutually exclusive and exhaustive events $(B_1, B_2, ..., B_n)$, ie. $P(A) = Σ P(A|B_i)P(B_i)$

== Fallacies
Prosecutor's fallacy: $P(A|B) = P(B|A)$, which is false.

Conjunction fallacy: $P(A inter B) > P(A)$, which is false.

Base rate fallacy: A cognitive bias where people ignore statistical "base rates" (the general prevalence of an event or trait) and instead focus on specific, individuating information, leading to inaccurate probability judgments.

= Statistical inference
Use a sample to draw a conclusion of the population.

sample statistic = population parameter + random error + bias

== Confidence interval
an interval of values computed from sample data that is likely to include the unknown value of a population parameter.

formula: sample statistic $plus.minus$ multiplier $times$ standard error
- multiplier: a number based on on the confidence level desired
- standard error: estimate of st. deviation

eg: 95% CI: $1.2 plus.minus 0.1$ or $[1.3, 1.5]$ => if many simple random samples are obtained, and a confidence level is constructed for each of them, 95% of the confidence intervals constructed would be in the population parameter (the actual value of the question posed)

== Chi Squared test
1. establish null and alternative hypothesis
2. collect sample data
3. calculate expected data if null hypothesis is true
4. get chi-squared value: $chi^2 = sum (O_i - E_i)^2/O_i$
5. if chi-squared value is large, p-value will be small

== hypothesis testing!!