import MyGrammar 
import MyTokens 

main :: IO() 
main = do
		result <- readFile "myTestInput.txt"
		let lexed = alexScanTokens result
		putStrLn ("lexed string " ++ show (lexed))
		let parsed = parseShit lexed 
		putStrLn ("parsed string is " ++ show (parsed))
		