{
module MyTokens where 
}

%wrapper "basic"
$digit = 0-9

tokens :- 
$white+			;
  "//".* 		;
  Prefix 			{ \s -> TokenPrefix }
  Copy 				{ \s -> TokenCopy }
  Arithmetic 		{ \s -> TokenArithmetic }
  Accumulator 		{ \s -> TokenAccumulator }
  Fibonacci 		{ \s -> TokenFibonacci }
  \;				{ \s -> TokenNewCommand }
  
{
data MyToken =
  TokenPrefix			|
  TokenCopy				|
  TokenArithmetic		|
  TokenAccumulator		|
  TokenFibonacci		|
  TokenNewCommand
  deriving (Eq,Show)
}