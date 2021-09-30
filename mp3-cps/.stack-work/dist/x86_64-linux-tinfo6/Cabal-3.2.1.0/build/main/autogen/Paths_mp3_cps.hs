{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_mp3_cps (
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

bindir     = "/home/eric/Downloads/mp3-cps/mp3-cps/.stack-work/install/x86_64-linux-tinfo6/eb0245da22de22890d366171649cc27764562c7fb8d98f2de38aa510d69157a9/8.10.4/bin"
libdir     = "/home/eric/Downloads/mp3-cps/mp3-cps/.stack-work/install/x86_64-linux-tinfo6/eb0245da22de22890d366171649cc27764562c7fb8d98f2de38aa510d69157a9/8.10.4/lib/x86_64-linux-ghc-8.10.4/mp3-cps-0.1.0.0-2CJaZQdFxnn5SJxp49Sl0X-main"
dynlibdir  = "/home/eric/Downloads/mp3-cps/mp3-cps/.stack-work/install/x86_64-linux-tinfo6/eb0245da22de22890d366171649cc27764562c7fb8d98f2de38aa510d69157a9/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/eric/Downloads/mp3-cps/mp3-cps/.stack-work/install/x86_64-linux-tinfo6/eb0245da22de22890d366171649cc27764562c7fb8d98f2de38aa510d69157a9/8.10.4/share/x86_64-linux-ghc-8.10.4/mp3-cps-0.1.0.0"
libexecdir = "/home/eric/Downloads/mp3-cps/mp3-cps/.stack-work/install/x86_64-linux-tinfo6/eb0245da22de22890d366171649cc27764562c7fb8d98f2de38aa510d69157a9/8.10.4/libexec/x86_64-linux-ghc-8.10.4/mp3-cps-0.1.0.0"
sysconfdir = "/home/eric/Downloads/mp3-cps/mp3-cps/.stack-work/install/x86_64-linux-tinfo6/eb0245da22de22890d366171649cc27764562c7fb8d98f2de38aa510d69157a9/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mp3_cps_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mp3_cps_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "mp3_cps_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "mp3_cps_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mp3_cps_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mp3_cps_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
