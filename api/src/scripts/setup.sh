#!/bin/bash

set -euo pipefail

npm run db:push

npx tsx src/scripts/seedUsers.ts