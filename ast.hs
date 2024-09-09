module ast
(
 eval,
) where

data Exp t
    = Var t
    | Const Integer
    | Add (Exp t) (Exp t)
    | Less (Exp t) (Exp t)
    | And (Exp t) (Exp t)
    | Not (Exp t)
    | If (Exp t) (Exp t) (Exp t)

type Env t = t -> Integer

eval :: Env t -> Exp t -> Integer
eval env (Var v) = env v
eval env (Const c) = c
eval env (Add e1 e2) = (eval env e1) + (eval env e2)
eval env (Less e1 e2)
	| eval env e1 < eval env e2 = 1
	| otherwise = 0
eval env (And e1 e2)
	| eval env e1 == eval env e2 == 1		= 1
	| otherwise		= 0

eval env (Not e1)
	| eval env e1 == 0	= 1
	| otherwise		= 0
eval env (If e1 e2 e3)
	| eval env e1 == 1	= eval env e2
	| otherwise		= eval env e3

instance Show a => Show (Exp a) where
	show (Var a) = show a
	show (Const i) = show i
	show (Add e1 e2) = "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
	show (Less e1 e2) = "(" ++ show e1 ++ " < " ++ show e2 ++ ")"
	show (And e1 e2) = "(" ++ show e1 ++ " & " ++ show e2 ++ ")"
	show (Not e) = "!(" ++ show e ++ ")"
	show (If b t e) = "(" ++ show b ++ " ? " ++ show t ++ " : " ++ show e ++ ")"


