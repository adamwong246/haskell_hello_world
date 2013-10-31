module Paths_y (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/r625503/.cabal/bin"
libdir     = "/Users/r625503/.cabal/lib/y-0.1.0.0/ghc-7.4.2"
datadir    = "/Users/r625503/.cabal/share/y-0.1.0.0"
libexecdir = "/Users/r625503/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "y_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "y_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "y_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "y_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
