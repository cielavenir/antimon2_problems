#!/usr/bin/ruby
require 'prime'

#[2013]
#Q1
def comb(n,k)
	r=1
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end
x=Prime.each.lazy.each_cons(2).take(100).find{|a,b|comb(b,a)==1121099408}
#p x # => nil
x=Prime.each.lazy.each_cons(3).take(100).find{|a,b,c|comb(c,a)==1121099408}
p x # => [31, 37, 41]

#Q2
p (1..1/0.0).find{|n|
	a,b=n/11,n%11
	a>0&&b>0&&(a**3-b**3).abs==n
}
# => 37

#[2014]
#Q1
#左辺について、5を底とする対数を取り、(Floatの誤差を防ぐため)移項する
p (1..1/0.0).find{|n|5**(5**5)/n**(n*n)<Math.log(n,5)}
# => 38
#右辺について、800を底とする対数を取り、(Floatの誤差を防ぐため)移項する
p (1..1/0.0).lazy.take_while{|n|Math.log(n,800)<800**800/n**(n*n)}.to_a.last
# => 38

#Q2
def sq?(n)
	x=Math.sqrt(n)
	x.to_i==x
end
p (1..1/0.0).find{|m|[m,38-m,38+m].map{|e|e*e}.all?{|e|
	sq?(e/10)&&sq?(e%10)
}}
# => 19

#Q3
p (1..1/0.0).lazy.select{|d|(1..d).reduce(:*).to_s.index('1111')}.take(2).to_a
# => [38, 169]
