#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

{-# LANGUAGE OverloadedStrings #-}

import Turtle
import Data.Text (pack)


default_id :: Text
default_id = pack (show (find (has ".rsa") "/home/eric/.ssh"))


parser :: Parser (Text, Maybe Text)
parser = (,) <$>           optText "target"  't' "IP of target pphone"
             <*> optional (optText "id"      'i' "HQ ssh authfile")

main :: IO ()
main = do 
    (target, mId) <- options "ssh for pphones" parser
    case mId of
      Nothing -> input (pack (show target)) & default_id
      Just id -> echo "ssh id target "
