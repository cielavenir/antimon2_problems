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

#[2015]
p [*2..6].permutation.count{|_a|
    t=2
    a=[1]+_a
    c=0
    (a.size+t-1).times.all?{|i|
        c=a[i%a.size]>a[(i+1)%a.size] ? c+1 : 0
        c<t
    }
}
# => 39
#追加問題：上記はA080635(5)に該当する。よってn=39のときはA080635(38)
#すなわちPARI/GPで、n=38; if( n<1, n==0, A = O(x); for( k=1, n, A = intformal( 1 + A + A^2)); n! * polcoeff( A, n)) # 317029010310200031444965610148232355333309
