import js from '@eslint/js'
import globals from 'globals'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import tseslint from 'typescript-eslint'
import { defineConfig, globalIgnores } from 'eslint/config'

export default defineConfig([
  globalIgnores(['dist']),
  {
    files: ['**/*.{ts,tsx}'],
    extends: [
      js.configs.recommended,
      tseslint.configs.recommended,
      reactHooks.configs.flat.recommended,
      reactRefresh.configs.vite,
    ],
    languageOptions: {
      globals: globals.browser,
    },
  },
  {
    // Fichier utilitaire de tests : chargé uniquement par Vitest, jamais par
    // le Fast Refresh de Vite, donc la contrainte "un seul export = composant" ne s'applique pas.
    files: ['src/test-utils.tsx'],
    rules: {
      'react-refresh/only-export-components': 'off',
    },
  },
])
