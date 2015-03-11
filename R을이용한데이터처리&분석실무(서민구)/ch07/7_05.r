### 7.05 적합도 검정
# 통계 분석에서는 종종 데이터가 특정 분포를 따름을 가정한다. 특히 데이터의 그기가 일정 수 이상이라면
# 데이터가 정규 분포를 따름을 별 의심없이 가정하기도 한다. 하지만 실제로 그 분포를 따르는지 확인해볼 수도 있다.

### 카이 제곱 검정
# 데이터가 특정 분포를 따르는지 살펴보기 위해 분할표를 만들고, 카이 제곱 검정Chi Squared Test을 사용할 수 있다.
# 다만 독립성 검정과 달리 Eij를 비교하고자 하는 분포로부터 계산한다.

# MASS::survey 데이터를 사용해 글씨를 왼손으로 쓰는 사람과 오른손으로 쓰는 사람의 비율이 30% : 70%인지 여부를
# 분석해보자. 아래에서 수행한 chisq.test()에서 귀무가설은 분할표에 주어진 관측데이터가 30% : 70% 의 분포를
# 따른다는 것이다.

table(survey$W.Hnd)
#  Left Right 
#   18   218 

chisq.test(table(survey$W.Hnd),p=c(.3,.7))

#        Chi-squared test for given probabilities
#
# data:  table(survey$W.Hnd)
# X-squared = 56.2518, df = 1, p-value = 6.376e-14

# p-value < 0.05이므로 글씨를 쓰는 사람과 오른손으로 쓰는 사람의 비가 30% : 70%라는 귀무가설을 기각한다.


### 샤피로 윌크 검정
# 샤피로 윌크 검정Shapiro-Wilk Test은 표본이 정규 분포로부터 추출된 것인지 테스트하기 위한 방법이다.
# 검정은 shapiro.test() 함수를 사용하며 이때 귀무가설은 주어진 데이터가 정규 분포로부터의 표본이라는 것이다.

# shapiro.test: 데이터가 정규 분포를 따르는지 샤피로 윌크 검정을 수행한다. 귀무가설은 정규 분포를 따른다는 것이다.
#  shapiro.test(
#	x # 숫자벡터
# )

# 다음은 정규분포를 따르는 1000개의 난수를 발생시킨 뒤 이 숫자들이 정규 분포를 따르는지 
# 샤피로 윌크 검정을 수행한 예다.
shapiro.test(rnorm(1000))
# 
#         Shapiro-Wilk normality test
# 
# data:  rnorm(1000)
# W = 0.9976, p-value = 0.1646

# p-value > 0.05이므로 데이터가 정규 분포를 따른다는 귀무가설을 기각할 수 없다.
# shapiro.test() 외에도 nortest 패키지에는 앤더스 달링 검정Anderson-Darling Test, 
# 피어슨 카이 제곱 검정 Pearson Chi-Square Test 등을 사용해 정규성을 검정하는 다양한 함수가 있다.


### 콜모고로프 스미르노프 검정
# 콜모고로프 스미르노프 검정Kolmogorov-Smirnov Test(K-S Test라고도 부름)은 데이터의 누적 분포 함수
# (7.1 난수생성 및 분포 함수)와 비교하고자 하는 분포의 누적 분포 함수Cumulative Distribution Function
# 간의 최대 거리를 통계량으로 사용하는 가설 검정 방법이다.

# ks.test : K-S검정을 수행. 귀무가설은 x,y에 차이가 없다고 보는 것이다.
#	x, # 숫자 벡터
#	y, # 숫자 벡터 또는 누적 분포 함수(예를 들면, pnorm)
#	..., # y에 지정한 누적 분포 함수에 넘겨줄 파라미터
#	alternative=c("two.sided", "less", "greater) # 대립가설

# 다음은 정규 분포를 따르는 두 난수 데이터 간에 분포가 동일한지를 살펴본 예다.
ks.test(rnorm(100), rnorm(100))

#         Two-sample Kolmogorov-Smirnov test
# 
# data:  rnorm(100) and rnorm(100)
# D = 0.11, p-value = 0.5806
# alternative hypothesis: two-sided

# p-value > 0.05이므로 두 난수가 같은 분포라는 귀무가설을 기각할 수 없다. 
# 다음은 정규 분포와 균등 분포Uniform Distribution간의 비교를 해보자.
ks.test(rnorm(100), runif(100))

#         Two-sample Kolmogorov-Smirnov test
# 
# data:  rnorm(100) and runif(100)
# D = 0.5, p-value = 2.778e-11
# alternative hypothesis: two-sided

# p-value가 0.05보다 작아 서로 다른 분포로 판단되었다.

# 다음은 K-S 검정을 사용해 데이터가 평균 0, 분산 1인 정규 분포로부터 뽑은 표본인지 확인하는 예다.
ks.test(rnorm(1000), "pnorm", 0, 1)

#         One-sample Kolmogorov-Smirnov test
# 
# data:  rnorm(1000)
# D = 0.0336, p-value = 0.2098
# alternative hypothesis: two-sided

# 귀무가설을 기각할 수 없어, 주어진 rnorm(100)은 평균0, 분산1인 정규 분포로부터의 표본이라고 결론.


### Q-Q도 
# Q-Q도Q-Q Plot는 데이터가 특정 분포를 따르는지를 시각적으로 검토하는 방법이다. Q는 분위수Quantile의 약어로
# Q-Q도는 비교하고자 하는 분포의 분위수끼리 좌표 평면에 표시하여 그린 그림이다.

# 분위수들을 차트에 그리고 나면 데이터의 분위수와 비교하고자 하는 분포의 분위수 간에 직선 관계가
# 보이는지 확인한다. 예를 들어, X가 정규 분포를 따르는지 살펴보고 싶다고 가정하자.
# X ~ N(u, a^2)이라면 다음 관계가 성립한다.

# Z = (X - u) / a ~ N(0,1)

# 즉, 정규 분포를 따르는 확률 변수는 정규화된 뒤에 평균이 0, 분산이 1인 정규 분포를 따른다.
# X를 Z로 표현하면 다음과 같다.
# X = u + aZ	(식7.3)

# 따라서 X가 정규 분포를 따를 때 (X, Z)를 좌표 평면에 표시한다면 식 7-3에 보인 직선이 나타나야 한다.
# Q-Q도는 이와 같은 직선 관계가 실제로 성립하는지 시각적으로 보여주는 도구다.

# (X, Z)에서 X는 주어진 데이터므로 이미 알고 있는 값이다. 따라서 X에 대응하는 Z만 찾으면 된다.
# 이때 분위수가 사용된다. X가 몇% 분위수인지를 안다면 N(0, 1)에서 해당 % 분위수를 찾아 Z로 하면 된다. 

# X값들이 몇% 분위수인지 찾아보자. X를 크기 순서로 정렬했을 때 관측값 x1 < x2 < ... < xn이 된다고 하고, 
# 이 데이터드의 분포를 표현하는 함수가 다음과 같다고 하자.

# G(xi) = (i - 3/8) / (n + 1/4)
# ... 

# qqline()은 Q-Q도에서 데이터가 만족해야 하는 직선 관계를 그린다.

# qqnorm: 주어진 데이터와 정규 확률 분포를 비교하는 Q-Q도를 그린다.
# qqnorm(
#	y # 데이터 셋
# )

# qqplot: 두 데이터 셋에 대한 Q-Q도를 그린다.
# qqplot(
#	x, 
# 	y
# )

# qqline: 데이터와 분포를 비교해 이론적으로 성립해야 하는 직선 관계를 그린다.
# qqline( 
#	y,
#	distribution=qnorm # 이론적 분포에 대한 quantile 함수
# )

# 다음은 N(10, 1)의 정규 분포를 따르는 난수 1000개를 구하고 Q-Q도를 그려 해당 숫자들이 정규 분포를 따르는지
# 확인해본 예다.
x <- rnorm(1000, mean=10, sd=1)
qqnorm(x)
qqline(x, lty=2)

# 비교를 위해 균등 분포로부터 생성한 데이터로 정규 확률 그림을 그려보자. 직선관계가 성립하지 않음을 알 수 있다.
x <- runif(1000)
qqnorm(x)
qqline(x, lwd=2)

# 데이터의 정규성이 Q-Q도를 통해 항상 명확히 판단되는 것은 아니다. 직선 관계가 성립한다 할지라도
# 데이터의 출처 및 데이터가 정규성을 따를 이유에 대한 고민이 항상 필요하다.

# 정규 확류 그림이 아닌 분포에 대해서는 qqplot() 함수를 사용한다. 다음은 c(1,2,3,4,5,6,7,8,9,10)이 
# U(1,10)의 균등 분포를 따르는지 확인하기 위해 Q-Q도를 그린 예다. 
# 비교할 대상인 U(1,10)은 runif()로 데이터를 만들었다.
qqplot(runif(1000, min=1, max=10), 1:10)

