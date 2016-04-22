#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

{-# LANGUAGE OverloadedStrings #-}

import Turtle


default_id :: Text
default_id = take 1 (filterByPattern ".rsa" "/home/eric/.ssh")


filterByPattern :: Pattern x -> FilePath -> Shell FilePath
filterByPattern somepattern somepath =
    case match somepattern (either id id (toText somepath)) of
        []        -> select []         -- no matches, so filter this path  
        otherwise -> select [somepath] -- let this path pass


parser :: Parser (Text, Maybe Text)
parser = (,) <$>           optText "target"  't' "IP of target pphone"
             <*> optional (optText "id"      'i' "HQ ssh authfile")

main :: IO ()
main = do 
    (target, mId) <- options "ssh for pphones" parser
    case mId of
      Nothing -> input target & default_id
      Just id -> ssh id target 
    echo (format ("Hello there, "%s) id)
    echo (format ("You are "%s%" years old") target)
