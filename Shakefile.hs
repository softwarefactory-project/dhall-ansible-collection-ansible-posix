-- Interpret using this command:
--    podman run -it --rm -v $(pwd):/data:Z quay.io/software-factory/shake-factory
--
-- Learn more at: https://softwarefactory-project.io/cgit/software-factory/shake-factory/tree/README.md

import Development.Shake
import ShakeFactory
import ShakeFactory.Dhall

root = "./AnsiblePosix/package.dhall"

main = shakeMain $ do
  want ["package.dhall"]
  "package.dhall" %> dhallTopLevelPackageAction root
  "//package.dhall" %> dhallPackageAction
  dhallDocsRules "dhall-ansible-collection-ansible-posix"
  dhallReleaseRules root
  cleanRules
