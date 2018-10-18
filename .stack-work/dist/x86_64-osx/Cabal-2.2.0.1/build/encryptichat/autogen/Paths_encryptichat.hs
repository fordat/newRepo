{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_encryptichat (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Ford/Documents/cs312/project/encryptichat/.stack-work/install/x86_64-osx/lts-12.13/8.4.3/bin"
libdir     = "/Users/Ford/Documents/cs312/project/encryptichat/.stack-work/install/x86_64-osx/lts-12.13/8.4.3/lib/x86_64-osx-ghc-8.4.3/encryptichat-0.1.0.0-F1UnnnhACTG58mNSnGXbdl-encryptichat"
dynlibdir  = "/Users/Ford/Documents/cs312/project/encryptichat/.stack-work/install/x86_64-osx/lts-12.13/8.4.3/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/Ford/Documents/cs312/project/encryptichat/.stack-work/install/x86_64-osx/lts-12.13/8.4.3/share/x86_64-osx-ghc-8.4.3/encryptichat-0.1.0.0"
libexecdir = "/Users/Ford/Documents/cs312/project/encryptichat/.stack-work/install/x86_64-osx/lts-12.13/8.4.3/libexec/x86_64-osx-ghc-8.4.3/encryptichat-0.1.0.0"
sysconfdir = "/Users/Ford/Documents/cs312/project/encryptichat/.stack-work/install/x86_64-osx/lts-12.13/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "encryptichat_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "encryptichat_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "encryptichat_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "encryptichat_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "encryptichat_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "encryptichat_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
