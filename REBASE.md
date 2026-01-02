# Documentación del Rebase Interactivo

## Objetivo

Limpiar el historial de commits fusionando commits relacionados y mejorando mensajes para mantener un historial claro y profesional.

## Estado Inicial

Teníamos **5 commits** con mensajes poco claros y sin seguir convenciones:
```
abc1234 remove file
def5678 update
ghi9012 fix typo
jkl3456 oops
mno7890 test
```

### Problemas identificados:
- Mensajes genéricos sin contexto ("test", "oops", "update")
- No siguen convenciones de commits (Conventional Commits)
- Múltiples commits para cambios relacionados
- Historial confuso y difícil de seguir

## Proceso de Rebase

### Comando ejecutado
```bash
git rebase -i HEAD~5
```

Este comando inicia un rebase interactivo de los últimos 5 commits.

### Acciones realizadas en el editor interactivo
```
reword mno7890 test          # Cambiar mensaje del primer commit
fixup jkl3456 oops          # Fusionar con anterior, descartar mensaje
fixup ghi9012 fix typo      # Fusionar con anterior, descartar mensaje
fixup def5678 update        # Fusionar con anterior, descartar mensaje
pick abc1234 remove file    # Mantener este commit (editaremos mensaje)
```

### Nuevos mensajes de commit

**Commit 1:**
```
chore: Add test file for Git rebase demonstration

- Created test file with multiple incremental changes
- Demonstrates the need for commit cleanup
- Will be removed after rebase practice
```

**Commit 2:**
```
chore: Remove test file after rebase demonstration

Cleaned up temporary test file used for demonstrating
Git rebase interactive workflow.
```

## Resultado Final

De **5 commits** pasamos a **2 commits** con mensajes claros:
```
xyz9876 chore: Remove test file after rebase demonstration
abc1234 chore: Add test file for Git rebase demonstration
```

### Mejoras logradas:
- ✅ Mensajes descriptivos y con contexto
- ✅ Siguiendo Conventional Commits (prefijo `chore:`)
- ✅ Commits relacionados fusionados en uno solo
- ✅ Historial limpio y fácil de entender
- ✅ Reducción de ruido en el log de Git

## Comandos de Rebase Interactivo

### Comandos principales:

- **pick (p)**: Usar el commit tal cual
- **reword (r)**: Usar el commit pero cambiar su mensaje
- **edit (e)**: Usar el commit pero pausar para hacer modificaciones
- **squash (s)**: Fusionar con el commit anterior manteniendo ambos mensajes
- **fixup (f)**: Fusionar con el commit anterior descartando el mensaje de este
- **drop (d)**: Eliminar el commit completamente

### Flujo de trabajo típico:

1. Identificar commits a limpiar
2. Ejecutar `git rebase -i HEAD~N` (N = número de commits)
3. En el editor, cambiar `pick` por el comando deseado
4. Guardar y cerrar
5. Editar mensajes cuando se solicite
6. Resolver conflictos si aparecen
7. Continuar con `git rebase --continue` o abortar con `git rebase --abort`

## Buenas Prácticas

### ✅ Cuándo hacer rebase:

- Antes de hacer push a una rama remota
- Para limpiar work-in-progress commits
- Para mantener un historial limpio en feature branches
- Cuando tienes commits de "fix typo" o "oops"

### ❌ Cuándo NO hacer rebase:

- En commits ya pusheados a ramas compartidas (main, develop)
- En commits que otros desarrolladores están usando como base
- En repositorios públicos con colaboradores externos

### Convenciones de mensajes (Conventional Commits):
```
<tipo>: <descripción corta>

<descripción larga opcional>

<footer opcional>
```

**Tipos comunes:**
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en documentación
- `chore`: Tareas de mantenimiento
- `refactor`: Refactorización de código
- `test`: Añadir o modificar tests
- `style`: Cambios de formato (no afectan funcionalidad)

## Comandos Útiles
```bash
# Ver historial compacto
git log --oneline -10

# Ver historial con grafo
git log --oneline --graph --decorate -10

# Ver detalles de un commit
git show <commit-hash>

# Rebase interactivo de últimos N commits
git rebase -i HEAD~N

# Continuar después de resolver conflictos
git rebase --continue

# Saltar un commit durante rebase
git rebase --skip

# Abortar rebase y volver al estado original
git rebase --abort

# Ver diferencias entre commits
git diff HEAD~2 HEAD

# Ver qué cambió en el último rebase
git reflog
```

## Lecciones Aprendidas

1. **Planificar commits**: Pensar en el mensaje antes de hacer commit
2. **Commits atómicos**: Cada commit debe representar un cambio lógico completo
3. **Mensajes descriptivos**: Explicar QUÉ y POR QUÉ, no solo CÓMO
4. **Rebase local**: Limpiar antes de compartir con el equipo
5. **Nunca rebase público**: `git push --force` solo en ramas personales

## Referencias

- [Git Rebase Documentation](https://git-scm.com/docs/git-rebase)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Atlassian Git Rebase Tutorial](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)

## Autor

- Alicia - Proyecto de prácticas ASIR DevOps
- Fecha: 2026-01-02
