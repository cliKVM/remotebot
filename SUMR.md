# Remote Control Automation z Ollama Vision

SUMD - Structured Unified Markdown Descriptor for AI-aware project refactorization

## Contents

- [Metadata](#metadata)
- [Architecture](#architecture)
- [Workflows](#workflows)
- [Call Graph](#call-graph)
- [Test Contracts](#test-contracts)
- [Refactoring Analysis](#refactoring-analysis)
- [Intent](#intent)

## Metadata

- **name**: `remotebot`
- **version**: `0.0.0`
- **ecosystem**: SUMD + DOQL + testql + taskfile
- **generated_from**: requirements.txt, Makefile, testql(2), app.doql.less, docker-compose.yml, project/(5 analysis files)

## Architecture

```
SUMD (description) → DOQL/source (code) → taskfile (automation) → testql (verification)
```

### DOQL Application Declaration (`app.doql.less`)

```less markpact:doql path=app.doql.less
// LESS format — define @variables here as needed

app {
  name: remotebot;
  version: 0.1.0;
}

interface[type="api"] {
  type: rest;
  framework: flask;
}

workflow[name="setup"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Przygotowywanie środowiska...$(NC)";
  step-2: run cmd=chmod +x setup.sh;
  step-3: run cmd=./setup.sh;
  step-4: run cmd=echo "$(GREEN)✓ Setup zakończony$(NC)";
}

workflow[name="build"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Budowanie obrazów Docker z cache...$(NC)";
  step-2: run cmd=DOCKER_BUILDKIT=1 docker-compose build;
  step-3: run cmd=echo "$(GREEN)✓ Obrazy zbudowane$(NC)";
}

workflow[name="build-no-cache"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Budowanie obrazów Docker bez cache...$(NC)";
  step-2: run cmd=DOCKER_BUILDKIT=1 docker-compose build --no-cache;
  step-3: run cmd=echo "$(GREEN)✓ Obrazy zbudowane$(NC)";
}

workflow[name="up"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Uruchamianie usług...$(NC)";
  step-2: run cmd=docker-compose up -d;
  step-3: run cmd=echo "$(GREEN)✓ Usługi uruchomione$(NC)";
  step-4: run cmd=echo "";
  step-5: run cmd=echo "$(YELLOW)Poczekaj 30-60 sekund na pełne uruchomienie$(NC)";
  step-6: run cmd=echo "";
  step-7: run cmd=$(MAKE) --no-print-directory info;
}

workflow[name="start"] {
  trigger: manual;
  step-1: depend target=up;
}

workflow[name="down"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Zatrzymywanie usług...$(NC)";
  step-2: run cmd=docker-compose down;
  step-3: run cmd=echo "$(GREEN)✓ Usługi zatrzymane$(NC)";
}

workflow[name="stop"] {
  trigger: manual;
  step-1: depend target=down;
}

workflow[name="restart"] {
  trigger: manual;
  step-1: depend target=down;
  step-2: depend target=up;
}

workflow[name="logs"] {
  trigger: manual;
  step-1: run cmd=docker-compose logs -f;
}

workflow[name="logs-vnc"] {
  trigger: manual;
  step-1: run cmd=docker-compose logs -f vnc-desktop;
}

workflow[name="logs-ollama"] {
  trigger: manual;
  step-1: run cmd=docker-compose logs -f ollama;
}

workflow[name="logs-controller"] {
  trigger: manual;
  step-1: run cmd=docker-compose logs -f automation-controller;
}

workflow[name="shell"] {
  trigger: manual;
  step-1: run cmd=docker-compose exec automation-controller /bin/bash;
}

workflow[name="shell-vnc"] {
  trigger: manual;
  step-1: run cmd=docker-compose exec vnc-desktop /bin/bash;
}

workflow[name="test"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Uruchamianie testów...$(NC)";
  step-2: run cmd=python3 run_tests.py;
}

workflow[name="test-wait"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Uruchamianie testów z czekaniem...$(NC)";
  step-2: run cmd=python3 run_tests.py --wait;
}

workflow[name="test-basic"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test podstawowy...$(NC)";
  step-2: run cmd=echo "$(YELLOW)⚠️  Ten test używa AI (Ollama) - może zająć 30-120s$(NC)";
  step-3: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_connection;
}

workflow[name="test-quick"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Szybki test połączenia (5s)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/quick_test.yaml quick_connection_test --no-recording;
}

workflow[name="test-firefox"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test Firefox...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_firefox;
}

workflow[name="test-firefox-simple"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test Firefox (simple)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_firefox_simple --no-recording;
}

workflow[name="test-firefox-ai"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test Firefox (AI)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_firefox_ai;
}

workflow[name="test-firefox-ai-debug"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test Firefox AI (debug)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_firefox_ai --debug --no-recording;
}

workflow[name="test-debug"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Debug ekranu (AI Vision)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_debug_screen --debug --no-recording;
}

workflow[name="test-debug-screenshots"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Debug screenshotów (co 1s)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_debug_screenshots --no-recording;
  step-3: run cmd=echo "$(GREEN)✓ Screenshoty zapisane w: results/screenshots/$(NC)";
}

workflow[name="test-ai-adaptive"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Adaptacyjna nawigacja...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml adaptive_firefox_navigation --no-recording;
}

workflow[name="test-ai-search"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Smart search...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml smart_search_and_select --no-recording;
}

workflow[name="test-ai-desktop-mapper"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Desktop mapper...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml desktop_mapper --no-recording;
}

workflow[name="test-ai-monitor"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Application state monitor...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml application_state_monitor --no-recording;
}

workflow[name="test-ai-editor"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Text editing + validation...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml intelligent_text_editing --no-recording;
}

workflow[name="test-ai-files"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: File navigation...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml smart_file_navigation --no-recording;
}

workflow[name="test-ai-forms"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Form interaction...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml smart_form_interaction --no-recording;
}

workflow[name="test-ai-errors"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Error detection...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml intelligent_error_detection --no-recording;
}

workflow[name="test-ai-windows"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Multi-window management...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml window_management_test --no-recording;
}

workflow[name="test-ai-visual"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Visual regression...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml visual_change_detection --no-recording;
}

workflow[name="test-ai-performance"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Performance monitor...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml ai_performance_monitor --no-recording;
}

workflow[name="test-ai-ui"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: UI validation...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml ui_validation_test --no-recording;
}

workflow[name="test-ai-commands"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)AI Test: Command output analysis...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml command_output_analysis --no-recording;
}

workflow[name="test-ai-all"] {
  trigger: manual;
  step-1: run cmd=echo "$(YELLOW)⚠️  Uruchamianie wszystkich testów AI - to może zająć 10-30 minut!$(NC)";
  step-2: run cmd=$(MAKE) --no-print-directory test-ai-adaptive;
  step-3: run cmd=$(MAKE) --no-print-directory test-ai-desktop-mapper;
  step-4: run cmd=$(MAKE) --no-print-directory test-ai-monitor;
  step-5: run cmd=$(MAKE) --no-print-directory test-ai-editor;
  step-6: run cmd=$(MAKE) --no-print-directory test-ai-files;
  step-7: run cmd=$(MAKE) --no-print-directory test-ai-errors;
  step-8: run cmd=$(MAKE) --no-print-directory test-ai-windows;
  step-9: run cmd=$(MAKE) --no-print-directory test-ai-visual;
  step-10: run cmd=$(MAKE) --no-print-directory test-ai-performance;
  step-11: run cmd=$(MAKE) --no-print-directory test-ai-ui;
  step-12: run cmd=$(MAKE) --no-print-directory test-ai-commands;
  step-13: run cmd=echo "$(GREEN)✓ Wszystkie testy AI zakończone!$(NC)";
}

workflow[name="list-ai-tests"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne testy AI:$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml dummy --list || true;
}

workflow[name="test-hybrid-performance"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Terminal performance...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml terminal_performance_analysis --no-recording;
}

workflow[name="test-hybrid-desktop"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Desktop analysis...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml desktop_visual_analysis --no-recording;
}

workflow[name="test-hybrid-firefox"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Firefox analysis...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml firefox_simple_analysis --no-recording;
}

workflow[name="test-hybrid-editor"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Text editor...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml text_editor_validation --no-recording;
}

workflow[name="test-hybrid-state"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: State monitoring...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml system_state_comparison --no-recording;
}

workflow[name="test-hybrid-errors"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Error analysis...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml error_message_analysis --no-recording;
}

workflow[name="test-hybrid-commands"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Command parsing...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml command_parsing_test --no-recording;
}

workflow[name="test-hybrid-accessibility"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Accessibility...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml ui_accessibility_test --no-recording;
}

workflow[name="test-hybrid-windows"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Hybrid Test: Window stress...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml window_stress_test --no-recording;
}

workflow[name="test-hybrid-all"] {
  trigger: manual;
  step-1: run cmd=echo "$(YELLOW)⚠️  Uruchamianie wszystkich hybrid testów - może zająć 10-20 minut!$(NC)";
  step-2: run cmd=$(MAKE) --no-print-directory test-hybrid-performance;
  step-3: run cmd=$(MAKE) --no-print-directory test-hybrid-desktop;
  step-4: run cmd=$(MAKE) --no-print-directory test-hybrid-firefox;
  step-5: run cmd=$(MAKE) --no-print-directory test-hybrid-editor;
  step-6: run cmd=$(MAKE) --no-print-directory test-hybrid-state;
  step-7: run cmd=$(MAKE) --no-print-directory test-hybrid-errors;
  step-8: run cmd=$(MAKE) --no-print-directory test-hybrid-commands;
  step-9: run cmd=$(MAKE) --no-print-directory test-hybrid-accessibility;
  step-10: run cmd=$(MAKE) --no-print-directory test-hybrid-windows;
  step-11: run cmd=echo "$(GREEN)✓ Wszystkie hybrid testy zakończone!$(NC)";
}

workflow[name="list-hybrid-tests"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne hybrid testy:$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml dummy --list || true;
}

workflow[name="test-auto-login"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: Smart detection (AI - slow)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml smart_login_detection --no-recording;
}

workflow[name="test-auto-login-cv"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: CV Fast (milliseconds)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml cv_fast_login --no-recording;
}

workflow[name="test-auto-login-retry"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: With retry...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml advanced_login_with_retry --no-recording;
}

workflow[name="test-system-login"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: System login...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml system_user_login --no-recording;
}

workflow[name="test-app-login"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: Application login...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml application_login_handler --no-recording;
}

workflow[name="test-password-manager"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: Smart password manager...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml smart_password_manager --no-recording;
}

workflow[name="test-multi-login"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Auto Login: Multi-stage login...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml multi_stage_login --no-recording;
}

workflow[name="list-auto-login"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne testy auto-login:$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml dummy --list || true;
}

workflow[name="test-cv-speed"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)CV Test: Fast detection (milliseconds)...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml cv_fast_detection --no-recording;
}

workflow[name="test-cv-unlock"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)CV Test: Fast unlock...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml cv_fast_unlock --no-recording;
}

workflow[name="test-cv-auto-login"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)CV Test: Auto-login complete...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml cv_auto_login_complete --no-recording;
}

workflow[name="test-cv-vs-ai"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Speed Benchmark: CV vs AI...$(NC)";
  step-2: run cmd=echo "$(YELLOW)⚠️  This will take ~1min (AI is slow)$(NC)";
  step-3: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml speed_benchmark --no-recording;
}

workflow[name="list-cv-tests"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne testy CV:$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml dummy --list || true;
}

workflow[name="test-diag-screen"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Diagnostics: Screen check...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml screen_diagnostics --no-recording;
}

workflow[name="test-diag-vnc"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Diagnostics: VNC connection check...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml vnc_connection_check --no-recording;
}

workflow[name="test-diag-lock"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Diagnostics: Lock screen detection...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml lock_screen_detection --no-recording;
}

workflow[name="test-diag-ready"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Diagnostics: Desktop ready check...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml desktop_ready_check --no-recording;
}

workflow[name="test-diag-full"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Diagnostics: Full system check...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml full_system_check --no-recording;
}

workflow[name="test-diag-recovery"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Diagnostics: Auto-recovery...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml auto_recovery --no-recording;
}

workflow[name="list-diag-tests"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne testy diagnostyczne:$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml dummy --list || true;
}

workflow[name="live-monitor"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Starting Live Automation Monitor...$(NC)";
  step-2: run cmd=echo "$(GREEN)📺 Open: http://localhost:5000$(NC)";
  step-3: run cmd=echo "";
  step-4: run cmd=docker-compose exec -T automation-controller python3 /app/live_monitor.py;
}

workflow[name="test-terminal"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test terminala...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_terminal;
}

workflow[name="test-no-recording"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Test bez nagrywania...$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_connection --no-recording;
}

workflow[name="list-scenarios"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne scenariusze:$(NC)";
  step-2: run cmd=docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml dummy --list || true;
}

workflow[name="interactive"] {
  trigger: manual;
  step-1: run cmd=docker-compose exec automation-controller python3 automation_cli.py test_scenarios/test_basic.yaml --interactive;
}

workflow[name="status"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Status usług:$(NC)";
  step-2: run cmd=docker-compose ps;
  step-3: run cmd=echo "";
  step-4: run cmd=echo "$(BLUE)Testy połączeń:$(NC)";
  step-5: run cmd=echo -n "VNC (5901): ";
  step-6: run cmd=nc -z -w2 localhost 5901 && echo "$(GREEN)✓ Działa$(NC)" || echo "$(RED)✗ Nie działa$(NC)";
  step-7: run cmd=echo -n "noVNC (6080): ";
  step-8: run cmd=nc -z -w2 localhost 6080 && echo "$(GREEN)✓ Działa$(NC)" || echo "$(RED)✗ Nie działa$(NC)";
  step-9: run cmd=echo -n "Ollama (11434): ";
  step-10: run cmd=nc -z -w2 localhost 11434 && echo "$(GREEN)✓ Działa$(NC)" || echo "$(RED)✗ Nie działa$(NC)";
}

workflow[name="info"] {
  trigger: manual;
  step-1: run cmd=echo "";
  step-2: run cmd=echo "$(GREEN)═══════════════════════════════════════════$(NC)";
  step-3: run cmd=echo "$(GREEN)  Remote Automation Environment$(NC)";
  step-4: run cmd=echo "$(GREEN)═══════════════════════════════════════════$(NC)";
  step-5: run cmd=echo "";
  step-6: run cmd=echo "$(YELLOW)📺 VNC Desktop:$(NC)";
  step-7: run cmd=echo "   VNC Client: localhost:5901 (hasło: automation)";
  step-8: run cmd=echo "   Przeglądarka: $(BLUE)http://localhost:6080/vnc.html$(NC)";
  step-9: run cmd=echo "";
  step-10: run cmd=echo "$(YELLOW)🤖 Ollama API:$(NC)";
  step-11: run cmd=echo "   URL: $(BLUE)http://localhost:11434$(NC)";
  step-12: run cmd=echo "";
  step-13: run cmd=echo "$(YELLOW)📊 Portainer:$(NC)";
  step-14: run cmd=echo "   URL: $(BLUE)http://localhost:9000$(NC)";
  step-15: run cmd=echo "";
  step-16: run cmd=echo "$(YELLOW)🧪 Szybkie testy:$(NC)";
  step-17: run cmd=echo "   make test-quick          - Szybki test (BEZ AI, 5s)";
  step-18: run cmd=echo "   make test-debug          - Debug ekranu (co widzi AI)";
  step-19: run cmd=echo "   make test-debug-screenshots - Screenshoty co 1s (5s)";
  step-20: run cmd=echo "   make test-firefox-simple - Firefox (BEZ AI)";
  step-21: run cmd=echo "   make test-firefox-ai-debug - Firefox AI + screenshoty";
  step-22: run cmd=echo "   make test-basic          - Podstawowy test (z AI, 30-60s)";
  step-23: run cmd=echo "   make test                - Pełny test suite";
  step-24: run cmd=echo "";
  step-25: run cmd=echo "$(YELLOW)🤖 Testy AI-Driven:$(NC)";
  step-26: run cmd=echo "   make list-ai-tests       - Lista wszystkich testów AI";
  step-27: run cmd=echo "   make test-ai-adaptive    - Adaptacyjna nawigacja Firefox";
  step-28: run cmd=echo "   make test-ai-desktop-mapper - AI mapuje pulpit";
  step-29: run cmd=echo "   make test-ai-monitor     - Monitor stanu aplikacji";
  step-30: run cmd=echo "   make test-ai-editor      - Inteligentna edycja tekstu";
  step-31: run cmd=echo "   make test-ai-errors      - Detekcja i diagnoza błędów";
  step-32: run cmd=echo "   make test-ai-performance - Monitoring wydajności systemu";
  step-33: run cmd=echo "   make test-ai-all         - Wszystkie testy AI (10-30min)";
  step-34: run cmd=echo "";
  step-35: run cmd=echo "$(YELLOW)🔀 Testy Hybrid (AI + Niezawodne akcje):$(NC)";
  step-36: run cmd=echo "   make list-hybrid-tests   - Lista hybrid testów";
  step-37: run cmd=echo "   make test-hybrid-performance - Terminal performance";
  step-38: run cmd=echo "   make test-hybrid-desktop - Analiza pulpitu";
  step-39: run cmd=echo "   make test-hybrid-errors  - Analiza błędów";
  step-40: run cmd=echo "   make test-hybrid-commands - Parsing komend";
  step-41: run cmd=echo "   make test-hybrid-all     - Wszystkie hybrid (10-20min)";
  step-42: run cmd=echo "";
  step-43: run cmd=echo "$(YELLOW)🔐 Auto-Login (Wykrywanie i wypełnianie):$(NC)";
  step-44: run cmd=echo "   make list-auto-login     - Lista testów logowania";
  step-45: run cmd=echo "   make test-auto-login-cv  - CV Fast login (milisekundy!) ⚡";
  step-46: run cmd=echo "   make test-auto-login     - AI detection (wolne ~60s)";
  step-47: run cmd=echo "   make test-system-login   - Logowanie do systemu";
  step-48: run cmd=echo "   make test-app-login      - Logowanie do aplikacji";
  step-49: run cmd=echo "   make test-password-manager - Smart password manager";
  step-50: run cmd=echo "   make test-multi-login    - Multi-stage login";
  step-51: run cmd=echo "";
  step-52: run cmd=echo "$(YELLOW)⚡ CV Detection (100x szybsze niż AI!):$(NC)";
  step-53: run cmd=echo "   make list-cv-tests       - Lista testów CV";
  step-54: run cmd=echo "   make test-cv-speed       - Fast detection (milisekundy!)";
  step-55: run cmd=echo "   make test-cv-unlock      - Fast unlock screen";
  step-56: run cmd=echo "   make test-cv-auto-login  - Complete auto-login (super fast)";
  step-57: run cmd=echo "   make test-cv-vs-ai       - Speed benchmark: CV vs AI";
  step-58: run cmd=echo "";
  step-59: run cmd=echo "$(YELLOW)🔍 Diagnostics (Sprawdzanie problemów):$(NC)";
  step-60: run cmd=echo "   make list-diag-tests     - Lista testów diagnostycznych";
  step-61: run cmd=echo "   make test-diag-screen    - Sprawdź stan ekranu";
  step-62: run cmd=echo "   make test-diag-vnc       - Sprawdź połączenie VNC";
  step-63: run cmd=echo "   make test-diag-lock      - Wykryj lock screen";
  step-64: run cmd=echo "   make test-diag-ready     - Czy desktop gotowy?";
  step-65: run cmd=echo "   make test-diag-full      - Pełne sprawdzenie (CV+AI)";
  step-66: run cmd=echo "   make test-diag-recovery  - Auto-recovery (odblokuj)";
  step-67: run cmd=echo "";
  step-68: run cmd=echo "$(YELLOW)🎬 Live Monitor (Web Interface):$(NC)";
  step-69: run cmd=echo "   make live-monitor        - Uruchom web monitoring (http://localhost:5000)";
  step-70: run cmd=echo "   Features: Live VNC preview + step list + real-time updates";
  step-71: run cmd=echo "";
  step-72: run cmd=echo "$(YELLOW)🎬 Nagrania testów:$(NC)";
  step-73: run cmd=echo "   Lokalizacja: $(BLUE)results/videos/$(NC)";
  step-74: run cmd=echo "   Format: MP4 (10 fps)";
  step-75: run cmd=echo "";
  step-76: run cmd=echo "$(YELLOW)📚 Więcej komend:$(NC)";
  step-77: run cmd=echo "   make help          - Pełna lista komend";
  step-78: run cmd=echo "";
}

workflow[name="vnc"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Otwieranie VNC w przeglądarce...$(NC)";
  step-2: run cmd=command -v xdg-open >/dev/null 2>&1 && xdg-open http://localhost:6080/vnc.html || open http://localhost:6080/vnc.html;
}

workflow[name="ps"] {
  trigger: manual;
  step-1: depend target=status;
}

workflow[name="pull-model"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Pobieranie modelu llava:7b...$(NC)";
  step-2: run cmd=docker-compose exec ollama ollama pull llava:7b;
  step-3: run cmd=echo "$(GREEN)✓ Model pobrany$(NC)";
}

workflow[name="pull-model-small"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Pobieranie modelu moondream...$(NC)";
  step-2: run cmd=docker-compose exec ollama ollama pull moondream;
  step-3: run cmd=echo "$(GREEN)✓ Model pobrany$(NC)";
}

workflow[name="list-models"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Zainstalowane modele:$(NC)";
  step-2: run cmd=docker-compose exec ollama ollama list;
}

workflow[name="clean"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Usuwanie kontenerów...$(NC)";
  step-2: run cmd=docker-compose down;
  step-3: run cmd=echo "$(GREEN)✓ Kontenery usunięte$(NC)";
}

workflow[name="clean-all"] {
  trigger: manual;
  step-1: run cmd=echo "$(RED)Usuwanie wszystkiego (włącznie z danymi)...$(NC)";
  step-2: run cmd=read -p "Czy na pewno? [y/N] " -n 1 -r; \;
  step-3: run cmd=echo; \;
  step-4: run cmd=if [[ $$REPLY =~ ^[Yy]$$ ]]; then \;
  step-5: run cmd=docker-compose down -v --rmi local; \;
  step-6: run cmd=echo "$(GREEN)✓ Wszystko usunięte$(NC)"; \;
  step-7: run cmd=else \;
  step-8: run cmd=echo "$(YELLOW)Anulowano$(NC)"; \;
  step-9: run cmd=fi;
}

workflow[name="clean-cache"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Usuwanie cache Docker...$(NC)";
  step-2: run cmd=docker volume rm -f remote-automation_pip-cache remote-automation_apt-cache 2>/dev/null || true;
  step-3: run cmd=docker builder prune -f;
  step-4: run cmd=echo "$(GREEN)✓ Cache usunięty$(NC)";
}

workflow[name="volumes"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Status volumes:$(NC)";
  step-2: run cmd=echo "";
  step-3: run cmd=echo "$(YELLOW)Ollama modele:$(NC)";
  step-4: run cmd=docker volume inspect remote-automation_ollama-data --format="Size: {{.Options}}" 2>/dev/null || echo "  Brak volume";
  step-5: run cmd=echo "";
  step-6: run cmd=echo "$(YELLOW)Cache volumes:$(NC)";
  step-7: run cmd=docker volume ls | grep remote-automation || echo "  Brak cache volumes";
}

workflow[name="models"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Zainstalowane modele Ollama:$(NC)";
  step-2: run cmd=docker-compose exec ollama ollama list 2>/dev/null || echo "Ollama nie działa";
}

workflow[name="backup-results"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Tworzenie backup wyników...$(NC)";
  step-2: run cmd=mkdir -p backups;
  step-3: run cmd=tar -czf backups/results-$$(date +%Y%m%d-%H%M%S).tar.gz results/;
  step-4: run cmd=echo "$(GREEN)✓ Backup utworzony$(NC)";
}

workflow[name="backup-models"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Tworzenie backup modeli Ollama...$(NC)";
  step-2: run cmd=mkdir -p backups;
  step-3: run cmd=docker run --rm -v remote-automation_ollama-data:/data -v $$(pwd)/backups:/backup alpine tar czf /backup/ollama-models-$$(date +%Y%m%d-%H%M%S).tar.gz -C /data .;
  step-4: run cmd=echo "$(GREEN)✓ Backup modeli utworzony$(NC)";
}

workflow[name="restore-models"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Dostępne backupy modeli:$(NC)";
  step-2: run cmd=ls -la backups/ollama-models-*.tar.gz 2>/dev/null || echo "Brak backupów modeli";
  step-3: run cmd=echo "";
  step-4: run cmd=echo "$(YELLOW)Aby przywrócić, użyj: docker run --rm -v remote-automation_ollama-data:/data -v \$$(pwd)/backups:/backup alpine tar xzf /backup/NAZWA_PLIKU.tar.gz -C /data$(NC)";
}

workflow[name="install-deps"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Instalowanie zależności...$(NC)";
  step-2: run cmd=pip3 install pillow requests pynput PyYAML vncdotool pytest;
  step-3: run cmd=echo "$(GREEN)✓ Zależności zainstalowane$(NC)";
}

workflow[name="check-docker"] {
  trigger: manual;
  step-1: run cmd=echo "$(BLUE)Sprawdzanie Docker...$(NC)";
  step-2: run cmd=docker --version && echo "$(GREEN)✓ Docker OK$(NC)" || echo "$(RED)✗ Docker nie znaleziony$(NC)";
  step-3: run cmd=docker-compose --version 2>/dev/null && echo "$(GREEN)✓ Docker Compose OK$(NC)" || \;
  step-4: run cmd=(docker compose version >/dev/null 2>&1 && echo "$(GREEN)✓ Docker Compose (plugin) OK$(NC)" || echo "$(RED)✗ Docker Compose nie znaleziony$(NC)");
}

workflow[name="dev"] {
  trigger: manual;
  step-1: depend target=up;
  step-2: depend target=test-wait;
}

workflow[name="quick"] {
  trigger: manual;
  step-1: run cmd=$(MAKE) --no-print-directory up;
  step-2: run cmd=sleep 5;
  step-3: run cmd=$(MAKE) --no-print-directory info;
}

tests {
  import: testql-scenarios/**/*.testql.toon.yaml;
}

env_vars {
  keys: VNC_PASSWORD, VNC_GEOMETRY, VNC_DEPTH, VNC_PORT, NO_VNC_PORT, DISPLAY, OLLAMA_PORT, OLLAMA_MODEL, OLLAMA_NUM_PARALLEL, OLLAMA_MAX_LOADED_MODELS, OLLAMA_NUM_CTX, OLLAMA_REQUEST_TIMEOUT, LOG_LEVEL, RESULTS_DIR, LOGS_DIR, SHARED_DIR, VNC_CONNECT_TIMEOUT, DEFAULT_ACTION_DELAY, PORTAINER_PORT, ENABLE_PORTAINER, COMPOSE_PROJECT_NAME, DOCKER_NETWORK_SUBNET, VNC_MEMORY_LIMIT, OLLAMA_MEMORY_LIMIT, CONTROLLER_MEMORY_LIMIT, VNC_CPU_LIMIT, OLLAMA_CPU_LIMIT, CONTROLLER_CPU_LIMIT, DEBUG_MODE, SAVE_SCREENSHOTS, SCREENSHOTS_DIR, AUTO_RESTART, VNC_USER, VNC_UID, VNC_GID, VNC_LOCALHOST_ONLY, VNC_HOST, OLLAMA_HOST, AUTO_BACKUP, BACKUP_DIR, TZ, CUSTOM_STARTUP_SCRIPT, CUSTOM_SCENARIOS_DIR, OLLAMA_AUTO_PULL_MODELS, OLLAMA_EXTRA_MODELS, HEALTHCHECK_INTERVAL, HEALTHCHECK_TIMEOUT, HEALTHCHECK_RETRIES, TEST_TIMEOUT, MAX_PARALLEL_TESTS, GENERATE_HTML_REPORT, ENABLE_EXPERIMENTAL, ENABLE_GPU;
}

deploy {
  target: docker-compose;
  compose_file: docker-compose.yml;
}

environment[name="local"] {
  runtime: docker-compose;
  env_file: .env;
  vars: AUTO_BACKUP, AUTO_RESTART, BACKUP_DIR, COMPOSE_PROJECT_NAME, CONTROLLER_CPU_LIMIT, CONTROLLER_MEMORY_LIMIT, CUSTOM_SCENARIOS_DIR, CUSTOM_STARTUP_SCRIPT, DEBUG_MODE, DEFAULT_ACTION_DELAY, DISPLAY, DOCKER_NETWORK_SUBNET, ENABLE_EXPERIMENTAL, ENABLE_GPU, ENABLE_PORTAINER, GENERATE_HTML_REPORT, HEALTHCHECK_INTERVAL, HEALTHCHECK_RETRIES, HEALTHCHECK_TIMEOUT, LOGS_DIR, LOG_LEVEL, MAX_PARALLEL_TESTS, NO_VNC_PORT, OLLAMA_AUTO_PULL_MODELS, OLLAMA_CPU_LIMIT, OLLAMA_EXTRA_MODELS, OLLAMA_HOST, OLLAMA_MAX_LOADED_MODELS, OLLAMA_MEMORY_LIMIT, OLLAMA_MODEL, OLLAMA_NUM_CTX, OLLAMA_NUM_PARALLEL, OLLAMA_PORT, OLLAMA_REQUEST_TIMEOUT, PORTAINER_PORT, RESULTS_DIR, SAVE_SCREENSHOTS, SCREENSHOTS_DIR, SHARED_DIR, TEST_TIMEOUT, TZ, VNC_CONNECT_TIMEOUT, VNC_CPU_LIMIT, VNC_DEPTH, VNC_GEOMETRY, VNC_GID, VNC_HOST, VNC_LOCALHOST_ONLY, VNC_MEMORY_LIMIT, VNC_PASSWORD, VNC_PORT, VNC_UID, VNC_USER;
  runtime_ollama: OLLAMA_AUTO_PULL_MODELS, OLLAMA_CPU_LIMIT, OLLAMA_EXTRA_MODELS, OLLAMA_HOST, OLLAMA_MAX_LOADED_MODELS, OLLAMA_MEMORY_LIMIT, OLLAMA_MODEL, OLLAMA_NUM_CTX, OLLAMA_NUM_PARALLEL, OLLAMA_PORT, OLLAMA_REQUEST_TIMEOUT;
}
```

## Workflows

## Call Graph

*15 nodes · 10 edges · 3 modules · CC̄=4.1*

### Hubs (by degree)

| Function | CC | in | out | total |
|----------|----|----|-----|-------|
| `run_scenario` *(in automation.run_scenario)* | 21 ⚠ | 1 | 47 | **48** |
| `execute_step` *(in automation.live_monitor)* | 11 ⚠ | 0 | 38 | **38** |
| `execute_all` *(in automation.live_monitor)* | 6 | 0 | 30 | **30** |
| `add_log` *(in automation.live_monitor)* | 2 | 21 | 6 | **27** |
| `main` *(in automation.automation_cli)* | 14 ⚠ | 0 | 22 | **22** |
| `capture_vnc_screenshot` *(in automation.live_monitor)* | 5 | 3 | 13 | **16** |
| `main` *(in automation.run_scenario)* | 5 | 0 | 16 | **16** |
| `connect_vnc` *(in automation.live_monitor)* | 3 | 0 | 15 | **15** |

```toon markpact:analysis path=project/calls.toon.yaml
# code2llm call graph | /home/tom/github/cliKVM/remotebot
# generated in 0.01s
# nodes: 15 | edges: 10 | modules: 3
# CC̄=4.1

HUBS[20]:
  automation.run_scenario.run_scenario
    CC=21  in:1  out:47  total:48
  automation.live_monitor.execute_step
    CC=11  in:0  out:38  total:38
  automation.live_monitor.execute_all
    CC=6  in:0  out:30  total:30
  automation.live_monitor.add_log
    CC=2  in:21  out:6  total:27
  automation.automation_cli.main
    CC=14  in:0  out:22  total:22
  automation.live_monitor.capture_vnc_screenshot
    CC=5  in:3  out:13  total:16
  automation.run_scenario.main
    CC=5  in:0  out:16  total:16
  automation.live_monitor.connect_vnc
    CC=3  in:0  out:15  total:15
  automation.live_monitor.load_scenario
    CC=2  in:1  out:5  total:6
  automation.live_monitor.disconnect_vnc
    CC=3  in:0  out:5  total:5
  automation.live_monitor.load_scenario_api
    CC=2  in:0  out:5  total:5
  automation.live_monitor.clear_logs
    CC=1  in:0  out:4  total:4
  automation.automation_cli.create_sample_config
    CC=1  in:1  out:3  total:4
  automation.run_scenario.load_scenario
    CC=1  in:2  out:2  total:4
  automation.live_monitor.screenshot_worker
    CC=4  in:0  out:2  total:2

MODULES:
  automation.automation_cli  [2 funcs]
    create_sample_config  CC=1  out:3
    main  CC=14  out:22
  automation.live_monitor  [10 funcs]
    add_log  CC=2  out:6
    capture_vnc_screenshot  CC=5  out:13
    clear_logs  CC=1  out:4
    connect_vnc  CC=3  out:15
    disconnect_vnc  CC=3  out:5
    execute_all  CC=6  out:30
    execute_step  CC=11  out:38
    load_scenario  CC=2  out:5
    load_scenario_api  CC=2  out:5
    screenshot_worker  CC=4  out:2
  automation.run_scenario  [3 funcs]
    load_scenario  CC=1  out:2
    main  CC=5  out:16
    run_scenario  CC=21  out:47

EDGES:
  automation.live_monitor.screenshot_worker → automation.live_monitor.capture_vnc_screenshot
  automation.live_monitor.load_scenario_api → automation.live_monitor.load_scenario
  automation.live_monitor.connect_vnc → automation.live_monitor.add_log
  automation.live_monitor.disconnect_vnc → automation.live_monitor.add_log
  automation.live_monitor.clear_logs → automation.live_monitor.add_log
  automation.live_monitor.execute_step → automation.live_monitor.add_log
  automation.live_monitor.execute_all → automation.live_monitor.add_log
  automation.automation_cli.main → automation.automation_cli.create_sample_config
  automation.run_scenario.run_scenario → automation.run_scenario.load_scenario
  automation.run_scenario.main → automation.run_scenario.run_scenario
```

## Test Contracts

*Scenarios as contract signatures — what the system guarantees.*

### Api (1)

**`Auto-generated API Smoke Tests`**
- assert `_status < 500`
- assert `_status >= 200`
- detectors: FlaskDetector, ConfigEndpointDetector

### Integration (1)

**`Auto-generated from Python Tests`**

## Refactoring Analysis

*Pre-refactoring snapshot — use this section to identify targets. Generated from `project/` toon files.*

### Call Graph & Complexity (`project/calls.toon.yaml`)

```toon markpact:analysis path=project/calls.toon.yaml
# code2llm call graph | /home/tom/github/cliKVM/remotebot
# generated in 0.01s
# nodes: 15 | edges: 10 | modules: 3
# CC̄=4.1

HUBS[20]:
  automation.run_scenario.run_scenario
    CC=21  in:1  out:47  total:48
  automation.live_monitor.execute_step
    CC=11  in:0  out:38  total:38
  automation.live_monitor.execute_all
    CC=6  in:0  out:30  total:30
  automation.live_monitor.add_log
    CC=2  in:21  out:6  total:27
  automation.automation_cli.main
    CC=14  in:0  out:22  total:22
  automation.live_monitor.capture_vnc_screenshot
    CC=5  in:3  out:13  total:16
  automation.run_scenario.main
    CC=5  in:0  out:16  total:16
  automation.live_monitor.connect_vnc
    CC=3  in:0  out:15  total:15
  automation.live_monitor.load_scenario
    CC=2  in:1  out:5  total:6
  automation.live_monitor.disconnect_vnc
    CC=3  in:0  out:5  total:5
  automation.live_monitor.load_scenario_api
    CC=2  in:0  out:5  total:5
  automation.live_monitor.clear_logs
    CC=1  in:0  out:4  total:4
  automation.automation_cli.create_sample_config
    CC=1  in:1  out:3  total:4
  automation.run_scenario.load_scenario
    CC=1  in:2  out:2  total:4
  automation.live_monitor.screenshot_worker
    CC=4  in:0  out:2  total:2

MODULES:
  automation.automation_cli  [2 funcs]
    create_sample_config  CC=1  out:3
    main  CC=14  out:22
  automation.live_monitor  [10 funcs]
    add_log  CC=2  out:6
    capture_vnc_screenshot  CC=5  out:13
    clear_logs  CC=1  out:4
    connect_vnc  CC=3  out:15
    disconnect_vnc  CC=3  out:5
    execute_all  CC=6  out:30
    execute_step  CC=11  out:38
    load_scenario  CC=2  out:5
    load_scenario_api  CC=2  out:5
    screenshot_worker  CC=4  out:2
  automation.run_scenario  [3 funcs]
    load_scenario  CC=1  out:2
    main  CC=5  out:16
    run_scenario  CC=21  out:47

EDGES:
  automation.live_monitor.screenshot_worker → automation.live_monitor.capture_vnc_screenshot
  automation.live_monitor.load_scenario_api → automation.live_monitor.load_scenario
  automation.live_monitor.connect_vnc → automation.live_monitor.add_log
  automation.live_monitor.disconnect_vnc → automation.live_monitor.add_log
  automation.live_monitor.clear_logs → automation.live_monitor.add_log
  automation.live_monitor.execute_step → automation.live_monitor.add_log
  automation.live_monitor.execute_all → automation.live_monitor.add_log
  automation.automation_cli.main → automation.automation_cli.create_sample_config
  automation.run_scenario.run_scenario → automation.run_scenario.load_scenario
  automation.run_scenario.main → automation.run_scenario.run_scenario
```

### Code Analysis (`project/analysis.toon.yaml`)

```toon markpact:analysis path=project/analysis.toon.yaml
# code2llm | 31f 8911L | yaml:14,python:8,shell:3,txt:2,yml:1 | 2026-07-05
# generated in 0.01s
# CC̅=4.1 | critical:2/92 | dups:0 | cycles:0

HEALTH[2]:
  🟡 CC    execute_dsl CC=62 (limit:15)
  🟡 CC    run_scenario CC=21 (limit:15)

REFACTOR[1]:
  1. split 2 high-CC methods  (CC>15)

PIPELINES[74]:
  [1] Src [main]: main
      PURITY: 100% pure
  [2] Src [__init__]: __init__
      PURITY: 100% pure
  [3] Src [clear_screen]: clear_screen
      PURITY: 100% pure
  [4] Src [get_container_stats]: get_container_stats
      PURITY: 100% pure
  [5] Src [get_container_status]: get_container_status
      PURITY: 100% pure
  [6] Src [check_vnc_port]: check_vnc_port
      PURITY: 100% pure
  [7] Src [check_novnc_port]: check_novnc_port
      PURITY: 100% pure
  [8] Src [check_ollama_api]: check_ollama_api
      PURITY: 100% pure
  [9] Src [get_recent_test_results]: get_recent_test_results
      PURITY: 100% pure
  [10] Src [draw_header]: draw_header
      PURITY: 100% pure
  [11] Src [draw_container_section]: draw_container_section
      PURITY: 100% pure
  [12] Src [draw_services_section]: draw_services_section
      PURITY: 100% pure
  [13] Src [draw_tests_section]: draw_tests_section
      PURITY: 100% pure
  [14] Src [draw_quick_commands]: draw_quick_commands
      PURITY: 100% pure
  [15] Src [draw_footer]: draw_footer
      PURITY: 100% pure
  [16] Src [display]: display
      PURITY: 100% pure
  [17] Src [run]: run
      PURITY: 100% pure
  [18] Src [main]: main
      PURITY: 100% pure
  [19] Src [screenshot_to_cv]: screenshot_to_cv
      PURITY: 100% pure
  [20] Src [detect_edges]: detect_edges
      PURITY: 100% pure
  [21] Src [detect_rectangles]: detect_rectangles
      PURITY: 100% pure
  [22] Src [find_window_center]: find_window_center
      PURITY: 100% pure
  [23] Src [detect_buttons]: detect_buttons
      PURITY: 100% pure
  [24] Src [find_text_field]: find_text_field
      PURITY: 100% pure
  [25] Src [template_match]: template_match
      PURITY: 100% pure
  [26] Src [detect_dialog_box]: detect_dialog_box
      PURITY: 100% pure
  [27] Src [find_unlock_button]: find_unlock_button
      PURITY: 100% pure
  [28] Src [is_screen_blank]: is_screen_blank
      PURITY: 100% pure
  [29] Src [get_screen_diagnostics]: get_screen_diagnostics
      PURITY: 100% pure
  [30] Src [quick_analysis]: quick_analysis
      PURITY: 100% pure
  [31] Src [screenshot_worker]: screenshot_worker → capture_vnc_screenshot
      PURITY: 100% pure
  [32] Src [index]: index
      PURITY: 100% pure
  [33] Src [list_scenarios]: list_scenarios
      PURITY: 100% pure
  [34] Src [load_scenario_api]: load_scenario_api → load_scenario
      PURITY: 100% pure
  [35] Src [get_steps]: get_steps
      PURITY: 100% pure
  [36] Src [connect_vnc]: connect_vnc → add_log
      PURITY: 100% pure
  [37] Src [disconnect_vnc]: disconnect_vnc → add_log
      PURITY: 100% pure
  [38] Src [get_screenshot]: get_screenshot
      PURITY: 100% pure
  [39] Src [video_feed]: video_feed
      PURITY: 100% pure
  [40] Src [get_status]: get_status
      PURITY: 100% pure
  [41] Src [get_logs]: get_logs
      PURITY: 100% pure
  [42] Src [clear_logs]: clear_logs → add_log
      PURITY: 100% pure
  [43] Src [download_logs]: download_logs
      PURITY: 100% pure
  [44] Src [execute_step]: execute_step → add_log
      PURITY: 100% pure
  [45] Src [execute_all]: execute_all → add_log
      PURITY: 100% pure
  [46] Src [encode_image]: encode_image
      PURITY: 100% pure
  [47] Src [analyze_screen]: analyze_screen
      PURITY: 100% pure
  [48] Src [find_element]: find_element
      PURITY: 100% pure
  [49] Src [__init__]: __init__
      PURITY: 100% pure
  [50] Src [connect]: connect
      PURITY: 100% pure

LAYERS:
  automation/                     CC̄=4.6    ←in:0  →out:0
  │ !! live_monitor              1170L  0C   18m  CC=11     ←0
  │ !! remote_automation          766L  3C   19m  CC=62     ←0
  │ cv_detection               416L  1C   14m  CC=7      ←0
  │ automation_cli             280L  0C    6m  CC=14     ←0
  │ config.yaml                252L  0C    0m  CC=0.0    ←0
  │ screen_recorder            236L  2C   10m  CC=6      ←0
  │ !! run_scenario               210L  0C    3m  CC=21     ←0
  │
  ./                              CC̄=2.5    ←in:0  →out:0
  │ !! Makefile                   550L  0C    0m  CC=0.0    ←0
  │ !! planfile.yaml              526L  0C    0m  CC=0.0    ←0
  │ setup_script.sh            435L  0C    4m  CC=0.0    ←0
  │ monitoring_dashboard       297L  2C   17m  CC=9      ←0
  │ cicd_integration.txt       269L  0C    0m  CC=0.0    ←0
  │ docker-compose.yml         113L  0C    0m  CC=0.0    ←0
  │ prefact.yaml                94L  0C    0m  CC=0.0    ←0
  │ project.sh                  69L  0C    0m  CC=0.0    ←0
  │ run_tests                   32L  0C    1m  CC=4      ←0
  │ requirements.txt            19L  0C    0m  CC=0.0    ←0
  │ tree.sh                      4L  0C    0m  CC=0.0    ←0
  │
  controller/                     CC̄=0.0    ←in:0  →out:0
  │ Dockerfile                  68L  0C    0m  CC=0.0    ←0
  │
  vnc/                            CC̄=0.0    ←in:0  →out:0
  │ Dockerfile                 154L  0C    0m  CC=0.0    ←0
  │
  test_scenarios/                 CC̄=0.0    ←in:0  →out:0
  │ !! ai_driven_tests.yaml       660L  0C    0m  CC=0.0    ←0
  │ !! advanced.yaml              649L  0C    0m  CC=0.0    ←0
  │ !! ai_hybrid_tests.yaml       614L  0C    0m  CC=0.0    ←0
  │ auto_login.yaml            386L  0C    0m  CC=0.0    ←0
  │ cv_speed_test.yaml         222L  0C    0m  CC=0.0    ←0
  │ diagnostics.yaml           177L  0C    0m  CC=0.0    ←0
  │ test_firefox_simple.yaml   102L  0C    0m  CC=0.0    ←0
  │ test_basic.yaml             74L  0C    0m  CC=0.0    ←0
  │ quick_test.yaml             17L  0C    0m  CC=0.0    ←0
  │
  testql-scenarios/               CC̄=0.0    ←in:0  →out:0
  │ generated-api-smoke.testql.toon.yaml    40L  0C    0m  CC=0.0    ←0
  │ generated-from-pytests.testql.toon.yaml    10L  0C    0m  CC=0.0    ←0
  │

COUPLING: no cross-package imports detected

EXTERNAL:
  validation: run `vallm batch .` → validation.toon
  duplication: run `redup scan .` → duplication.toon
```

### Duplication (`project/duplication.toon.yaml`)

```toon markpact:analysis path=project/duplication.toon.yaml
# redup/duplication | 0 groups | 0f 0L | 2026-07-05

SUMMARY:
  files_scanned: 0
  total_lines:   0
  dup_groups:    0
  dup_fragments: 0
  saved_lines:   0
  scan_ms:       4
```

### Evolution / Churn (`project/evolution.toon.yaml`)

```toon markpact:analysis path=project/evolution.toon.yaml
# code2llm/evolution | 92 func | 9f | 2026-07-05
# generated in 0.00s

NEXT[5] (ranked by impact):
  [1] !! SPLIT           automation/remote_automation.py
      WHY: 766L, 3 classes, max CC=62
      EFFORT: ~4h  IMPACT: 47492

  [2] !! SPLIT           automation/live_monitor.py
      WHY: 1170L, 0 classes, max CC=11
      EFFORT: ~4h  IMPACT: 12870

  [3] !! SPLIT-FUNC      AutomationEngine.execute_dsl  CC=62  fan=36
      WHY: CC=62 exceeds 15
      EFFORT: ~1h  IMPACT: 2232

  [4] !  SPLIT-FUNC      run_scenario  CC=21  fan=16
      WHY: CC=21 exceeds 15
      EFFORT: ~1h  IMPACT: 336

  [5] !! SPLIT           test_scenarios/ai_driven_tests.yaml
      WHY: 660L, 0 classes, max CC=0
      EFFORT: ~4h  IMPACT: 0


RISKS[3]:
  ⚠ Splitting automation/live_monitor.py may break 18 import paths
  ⚠ Splitting automation/remote_automation.py may break 19 import paths
  ⚠ Splitting test_scenarios/ai_driven_tests.yaml may break 0 import paths

METRICS-TARGET:
  CC̄:          4.1 → ≤2.9
  max-CC:      62 → ≤20
  god-modules: 7 → 0
  high-CC(≥15): 2 → ≤1
  hub-types:   0 → ≤0

PATTERNS (language parser shared logic):
  _extract_declarations() in base.py — unified extraction for:
    - TypeScript: interfaces, types, classes, functions, arrow funcs
    - PHP: namespaces, traits, classes, functions, includes
    - Ruby: modules, classes, methods, requires
    - C++: classes, structs, functions, #includes
    - C#: classes, interfaces, methods, usings
    - Java: classes, interfaces, methods, imports
    - Go: packages, functions, structs
    - Rust: modules, functions, traits, use statements

  Shared regex patterns per language:
    - import: language-specific import/require/using patterns
    - class: class/struct/trait declarations with inheritance
    - function: function/method signatures with visibility
    - brace_tracking: for C-family languages ({ })
    - end_keyword_tracking: for Ruby (module/class/def...end)

  Benefits:
    - Consistent extraction logic across all languages
    - Reduced code duplication (~70% reduction in parser LOC)
    - Easier maintenance: fix once, apply everywhere
    - Standardized FunctionInfo/ClassInfo models

HISTORY:
  prev CC̄=4.1 → now CC̄=4.1
```

## Intent

Remote Control Automation z Ollama Vision
