{
module MyGrammar where 
import MyTokens 
}

%name parseShit 
%tokentype { MyToken } 
%error { parseError }
%token 
	Prefix 			{ TokenPrefix }
	Copy 			{ TokenCopy }
	Arithmetic 		{ TokenArithmetic }
	Accumulator     { TokenAccumulator }
	Fibonacci 		{ TokenFibonacci }
	';'				{ TokenNewCommand }

%%	
Exp : Prefix 		{ Prefix } 
	| Copy 			{ Copy }
	| Arithmetic	{ Arithmetic }
	| Accumulator   { Accumulator }
	| Fibonacci     { Fibonacci }
	| Exp ';' Exp 	{ Commands $1 $3 }
	
{
parseError :: [MyToken] -> a
parseError _ = error "Unknown Parse Error" 

data Exp = Prefix 
         | Copy 
		 | Arithmetic 
		 | Accumulator 
		 | Fibonacci
		 | Commands Exp Exp
		 deriving Show
}

	