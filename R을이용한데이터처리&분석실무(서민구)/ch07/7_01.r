

### 01.난수 생성 및 분포 함수

# 확률 분포별 난수 발생 함수
# 이항(Binomial) 분포 : rbinorm
# F분포 : rf
# 기하(Geometric) 분포 : rgeom
# 초기하(Hypergeometric) 분포 : rhyper
# 음이항(Negative Binomial) 분포 : rnbinom
# 정규(Normal) 분포 : rnorm
# 포아송(Poisson)분포 : rpois
# t분포 : rt
# 연속균등(Uniform) 분포 : runif
# 전체목록은 help("Distributions")로 볼 수 있다
help("Distributions")
rnorm(100, 0, 10)

plot(density(rnorm(1000000,0,10)))

# 확률 밀도 함수Probability Density Function 또는 확률 질량 함수 Probability Mass Function는
# d 뒤에 분포명을 적는다. 예를 들어, 정규 분포의 경우 dnorm()을 사용한다.

# 분포 함수 Distribute Function는 p 뒤에 분포명을 적은 형태다. 예를 들어, 정규분포의 분포함수는
# pnorm()이다. 

# 분위수 Quantile는 q뒤에 분포명을 적으며, 정규 분포의 경우 qnorm()으로 구한다. qnorm()이
# pnorm()의 역함수에 해당하는데, p와 q가 알파벳에서 연속된 문자임을 상기하면 기억하기 쉽다.

# <Note> 분포함수와 확률 밀도 함수, 확률 질량함수
# 실험에서 나타난 결과를 실수로 표현한 변수 X를 확률 변수라 한다. 예를 들어, 동전 두 개를 던졌을 때 
# 앞면의 개수 X, 웹페이지의 하이퍼링크가 클릭된 수 X, 강수량 X가 확률 변수의 예다.

# 분포함수: 확률변수의 누적분포를 기술하는 함수, F(x)로 표현. 
# F(x)는 확률 변수 X가 x이하의 값을 가질 확률을 뜻한다. 즉, F(x) = P(X <= x)

# 확률 밀도 함수: 연속형 데이터의 확률을 표현한다.(강수량, 키, 몸무게 등)
# 확률 밀도 함수는 f(x)처럼 표시한다. 그러나 연속형 데이터의 경우 x를 하나의 정확한 값으로 정하기 곤란하다.
# 따라서 f(x)는 구간에 대해 정의하며, 함수를 특정 구간에 대해 적분한 값이 확률 변수 X가 
# 그 구간에 속할 확률이 되는 함수다. 

# 확률 질량 함수(Probability Mass Function): x가 이산형 값들만 가진다면 특정 x에 대한 확률을 계산할 수 있다.
# 예를 들어, 동전 한 개를 던졌을 때 앞면의 수를 X라하면 P(X=1)은 앞면,뒷면 구 가지 가능성 중 하나에 해당하므로
# 1/2이다. 이러한 P(X=x)를 확률 질량 함수라고 하며, p(x)로 적는다. 
# 확률 질량 함수에서는 확률 밀도 함수와 달리 p(0), p(1)처럼 구간이 아닌 특정 값에 대한 확률을 이야기 할 수 있다.

# R에서 d로 시작하는 함수(예를 들면, dnorm함수)는 f(x), p(x)를 계산하며, q로 시작하는 함수는 F(x)를 계산한다.


