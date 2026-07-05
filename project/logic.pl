% ── Project Metadata ─────────────────────────────────────
project_metadata('remotebot', '0.0.0', 'python').

% ── Project Files ────────────────────────────────────────
project_file('app.doql.less', 732, 'less').
project_file('automation/automation_cli.py', 281, 'python').
project_file('automation/cv_detection.py', 417, 'python').
project_file('automation/live_monitor.py', 1171, 'python').
project_file('automation/quick_test.py', 47, 'python').
project_file('automation/remote_automation.py', 767, 'python').
project_file('automation/run_scenario.py', 211, 'python').
project_file('automation/screen_recorder.py', 237, 'python').
project_file('monitoring_dashboard.py', 298, 'python').
project_file('project.sh', 69, 'shell').
project_file('run_tests.py', 33, 'python').
project_file('setup_script.sh', 436, 'shell').
project_file('test_suite.py', 398, 'python').
project_file('tree.sh', 5, 'shell').

% ── Python Functions ─────────────────────────────────────
python_function('automation/automation_cli.py', 'load_config', 1, 1, 2).
python_function('automation/automation_cli.py', 'list_scenarios', 1, 3, 4).
python_function('automation/automation_cli.py', 'run_scenario', 3, 11, 12).
python_function('automation/automation_cli.py', 'interactive_mode', 1, 9, 7).
python_function('automation/automation_cli.py', 'create_sample_config', 0, 1, 3).
python_function('automation/automation_cli.py', 'main', 0, 14, 13).
python_function('automation/live_monitor.py', 'add_log', 2, 2, 6).
python_function('automation/live_monitor.py', 'load_scenario', 2, 2, 3).
python_function('automation/live_monitor.py', 'capture_vnc_screenshot', 0, 5, 8).
python_function('automation/live_monitor.py', 'screenshot_worker', 0, 4, 2).
python_function('automation/live_monitor.py', 'index', 0, 1, 2).
python_function('automation/live_monitor.py', 'list_scenarios', 0, 5, 10).
python_function('automation/live_monitor.py', 'load_scenario_api', 2, 2, 4).
python_function('automation/live_monitor.py', 'get_steps', 0, 1, 3).
python_function('automation/live_monitor.py', 'connect_vnc', 0, 3, 9).
python_function('automation/live_monitor.py', 'disconnect_vnc', 0, 3, 4).
python_function('automation/live_monitor.py', 'get_screenshot', 0, 4, 8).
python_function('automation/live_monitor.py', 'video_feed', 0, 1, 4).
python_function('automation/live_monitor.py', 'get_status', 0, 2, 3).
python_function('automation/live_monitor.py', 'get_logs', 0, 1, 3).
python_function('automation/live_monitor.py', 'clear_logs', 0, 1, 4).
python_function('automation/live_monitor.py', 'download_logs', 0, 2, 5).
python_function('automation/live_monitor.py', 'execute_step', 1, 11, 13).
python_function('automation/live_monitor.py', 'execute_all', 0, 6, 15).
python_function('automation/quick_test.py', 'main', 0, 2, 6).
python_function('automation/remote_automation.py', 'main', 0, 2, 7).
python_function('automation/run_scenario.py', 'load_scenario', 1, 1, 2).
python_function('automation/run_scenario.py', 'run_scenario', 4, 21, 13).
python_function('automation/run_scenario.py', 'main', 0, 5, 9).
python_function('automation/screen_recorder.py', 'record_test', 3, 1, 2).
python_function('monitoring_dashboard.py', 'main', 0, 2, 6).
python_function('run_tests.py', 'main', 0, 4, 5).
python_function('test_suite.py', 'main', 0, 4, 6).

% ── Python Classes ───────────────────────────────────────
python_class('automation/cv_detection.py', 'CVDetector').
python_method('CVDetector', '__init__', 0, 1, 0).
python_method('CVDetector', 'set_debug', 1, 1, 0).
python_method('CVDetector', 'screenshot_to_cv', 1, 3, 5).
python_method('CVDetector', 'detect_edges', 3, 2, 4).
python_method('CVDetector', 'detect_rectangles', 2, 7, 9).
python_method('CVDetector', 'find_window_center', 1, 2, 1).
python_method('CVDetector', 'detect_buttons', 1, 5, 4).
python_method('CVDetector', 'find_text_field', 1, 5, 5).
python_method('CVDetector', 'template_match', 3, 4, 4).
python_method('CVDetector', 'detect_dialog_box', 1, 6, 1).
python_method('CVDetector', 'find_unlock_button', 1, 3, 3).
python_method('CVDetector', 'is_screen_blank', 2, 2, 3).
python_method('CVDetector', 'get_screen_diagnostics', 1, 5, 7).
python_method('CVDetector', 'quick_analysis', 1, 6, 7).
python_class('automation/remote_automation.py', 'OllamaVision').
python_method('OllamaVision', '__init__', 2, 5, 0).
python_method('OllamaVision', 'encode_image', 1, 1, 5).
python_method('OllamaVision', 'analyze_screen', 2, 4, 6).
python_method('OllamaVision', 'find_element', 2, 6, 8).
python_class('automation/remote_automation.py', 'RemoteController').
python_method('RemoteController', '__init__', 3, 5, 1).
python_method('RemoteController', 'connect', 0, 4, 4).
python_method('RemoteController', '_connect_vnc', 0, 1, 3).
python_method('RemoteController', '_connect_rdp', 0, 1, 4).
python_method('RemoteController', '_connect_spice', 0, 1, 3).
python_method('RemoteController', 'click', 2, 4, 4).
python_method('RemoteController', 'type_text', 1, 4, 4).
python_method('RemoteController', 'key_press', 1, 5, 6).
python_method('RemoteController', 'capture_screen', 0, 5, 7).
python_method('RemoteController', 'disconnect', 0, 13, 8).
python_class('automation/remote_automation.py', 'AutomationEngine').
python_method('AutomationEngine', '__init__', 4, 5, 6).
python_method('AutomationEngine', 'log', 2, 1, 4).
python_method('AutomationEngine', 'save_screenshot', 2, 2, 6).
python_method('AutomationEngine', 'execute_dsl', 2, 62, 32).
python_class('automation/screen_recorder.py', 'ScreenRecorder').
python_method('ScreenRecorder', '__init__', 4, 1, 3).
python_method('ScreenRecorder', 'start_recording', 3, 3, 10).
python_method('ScreenRecorder', '_recording_loop', 0, 4, 7).
python_method('ScreenRecorder', 'stop_recording', 0, 6, 7).
python_method('ScreenRecorder', '_pil_to_opencv', 1, 3, 4).
python_method('ScreenRecorder', 'add_text_overlay', 3, 1, 3).
python_class('automation/screen_recorder.py', 'RecordingContext').
python_method('RecordingContext', '__init__', 3, 1, 0).
python_method('RecordingContext', '__enter__', 0, 1, 1).
python_method('RecordingContext', '__exit__', 3, 1, 1).
python_class('monitoring_dashboard.py', 'Colors').
python_class('monitoring_dashboard.py', 'Monitor').
python_method('Monitor', '__init__', 0, 1, 1).
python_method('Monitor', 'clear_screen', 0, 2, 1).
python_method('Monitor', 'get_container_stats', 1, 4, 4).
python_method('Monitor', 'get_container_status', 1, 4, 4).
python_method('Monitor', 'check_vnc_port', 0, 2, 1).
python_method('Monitor', 'check_novnc_port', 0, 2, 1).
python_method('Monitor', 'check_ollama_api', 0, 4, 2).
python_method('Monitor', 'get_recent_test_results', 0, 3, 5).
python_method('Monitor', 'draw_header', 0, 1, 3).
python_method('Monitor', 'draw_container_section', 0, 5, 3).
python_method('Monitor', 'draw_services_section', 0, 9, 5).
python_method('Monitor', 'draw_tests_section', 0, 7, 5).
python_method('Monitor', 'draw_quick_commands', 0, 1, 1).
python_method('Monitor', 'draw_footer', 0, 1, 1).
python_method('Monitor', 'display', 0, 1, 7).
python_method('Monitor', 'run', 1, 3, 4).
python_class('test_suite.py', 'Colors').
python_class('test_suite.py', 'TestRunner').
python_method('TestRunner', '__init__', 0, 1, 1).
python_method('TestRunner', 'info', 1, 1, 1).
python_method('TestRunner', 'success', 1, 1, 1).
python_method('TestRunner', 'error', 1, 1, 1).
python_method('TestRunner', 'warning', 1, 1, 1).
python_method('TestRunner', 'run_command', 2, 5, 2).
python_method('TestRunner', 'test_docker_running', 0, 3, 4).
python_method('TestRunner', 'test_containers_running', 0, 4, 5).
python_method('TestRunner', 'test_vnc_port', 0, 3, 5).
python_method('TestRunner', 'test_novnc_port', 0, 3, 5).
python_method('TestRunner', 'test_ollama_api', 0, 6, 7).
python_method('TestRunner', 'test_ollama_model', 0, 9, 6).
python_method('TestRunner', 'test_vnc_connection', 0, 3, 4).
python_method('TestRunner', 'test_automation_simple', 0, 3, 6).
python_method('TestRunner', 'test_desktop_screenshot', 0, 3, 8).
python_method('TestRunner', 'test_ollama_vision', 0, 3, 8).
python_method('TestRunner', 'run_all_tests', 0, 4, 13).

% ── Dependencies ─────────────────────────────────────────
project_dependency('pillow>=10.0.0', 'requirements.txt').
project_dependency('requests>=2.31.0', 'requirements.txt').
project_dependency('PyYAML>=6.0', 'requirements.txt').
project_dependency('vncdotool>=1.2.0', 'requirements.txt').
project_dependency('pytest>=7.0.0', 'requirements.txt').
project_dependency('pytest-html>=3.1.0', 'requirements.txt').
project_dependency('opencv-python>=4.8.0', 'requirements.txt').
project_dependency('numpy>=1.21.0', 'requirements.txt').
project_dependency('flask>=2.3.0', 'requirements.txt').

% ── Makefile Targets ─────────────────────────────────────
makefile_target('help', '').
makefile_target('setup', '').
makefile_target('build', '').
makefile_target('build-no-cache', '').
makefile_target('up', '').
makefile_target('start', '').
makefile_target('down', '').
makefile_target('stop', '').
makefile_target('restart', '').
makefile_target('logs', '').
makefile_target('logs-vnc', '').
makefile_target('logs-ollama', '').
makefile_target('logs-controller', '').
makefile_target('shell', '').
makefile_target('shell-vnc', '').
makefile_target('test', '').
makefile_target('test-wait', '').
makefile_target('test-basic', '').
makefile_target('test-quick', '').
makefile_target('test-firefox', '').
makefile_target('test-firefox-simple', '').
makefile_target('test-firefox-ai', '').
makefile_target('test-firefox-ai-debug', '').
makefile_target('test-debug', '').
makefile_target('test-debug-screenshots', '').
makefile_target('test-ai-adaptive', '').
makefile_target('test-ai-search', '').
makefile_target('test-ai-desktop-mapper', '').
makefile_target('test-ai-monitor', '').
makefile_target('test-ai-editor', '').
makefile_target('test-ai-files', '').
makefile_target('test-ai-forms', '').
makefile_target('test-ai-errors', '').
makefile_target('test-ai-windows', '').
makefile_target('test-ai-visual', '').
makefile_target('test-ai-performance', '').
makefile_target('test-ai-ui', '').
makefile_target('test-ai-commands', '').
makefile_target('test-ai-all', '').
makefile_target('list-ai-tests', '').
makefile_target('test-hybrid-performance', '').
makefile_target('test-hybrid-desktop', '').
makefile_target('test-hybrid-firefox', '').
makefile_target('test-hybrid-editor', '').
makefile_target('test-hybrid-state', '').
makefile_target('test-hybrid-errors', '').
makefile_target('test-hybrid-commands', '').
makefile_target('test-hybrid-accessibility', '').
makefile_target('test-hybrid-windows', '').
makefile_target('test-hybrid-all', '').
makefile_target('list-hybrid-tests', '').
makefile_target('test-auto-login', '').
makefile_target('test-auto-login-cv', '').
makefile_target('test-auto-login-retry', '').
makefile_target('test-system-login', '').
makefile_target('test-app-login', '').
makefile_target('test-password-manager', '').
makefile_target('test-multi-login', '').
makefile_target('list-auto-login', '').
makefile_target('test-cv-speed', '').
makefile_target('test-cv-unlock', '').
makefile_target('test-cv-auto-login', '').
makefile_target('test-cv-vs-ai', '').
makefile_target('list-cv-tests', '').
makefile_target('test-diag-screen', '').
makefile_target('test-diag-vnc', '').
makefile_target('test-diag-lock', '').
makefile_target('test-diag-ready', '').
makefile_target('test-diag-full', '').
makefile_target('test-diag-recovery', '').
makefile_target('list-diag-tests', '').
makefile_target('live-monitor', '').
makefile_target('test-terminal', '').
makefile_target('test-no-recording', '').
makefile_target('list-scenarios', '').
makefile_target('interactive', '').
makefile_target('status', '').
makefile_target('info', '').
makefile_target('vnc', '').
makefile_target('ps', '').
makefile_target('pull-model', '').
makefile_target('pull-model-small', '').
makefile_target('list-models', '').
makefile_target('clean', '').
makefile_target('clean-all', '').
makefile_target('clean-cache', '').
makefile_target('volumes', '').
makefile_target('models', '').
makefile_target('backup-results', '').
makefile_target('backup-models', '').
makefile_target('restore-models', '').
makefile_target('install-deps', '').
makefile_target('check-docker', '').
makefile_target('dev', 'Szybkie komendy do developmentu').
makefile_target('quick', '').

% ── Taskfile Tasks ───────────────────────────────────────

% ── Environment Variables ────────────────────────────────

% ── TestQL Scenarios ─────────────────────────────────────
testql_scenario('generated-api-smoke.testql.toon.yaml', 'api').
testql_scenario('generated-from-pytests.testql.toon.yaml', 'integration').

% ── Semantic Facts from SUMD.md ──────────────────────────
sumd_declared_file('app.doql.less', 'doql').
sumd_declared_file('testql-scenarios/generated-api-smoke.testql.toon.yaml', 'testql').
sumd_declared_file('testql-scenarios/generated-from-pytests.testql.toon.yaml', 'testql').
sumd_declared_file('project/map.toon.yaml', 'analysis').
sumd_declared_file('project/logic.pl', 'analysis').
sumd_declared_file('project/calls.toon.yaml', 'analysis').
sumd_interface('api', '').
sumd_workflow('setup', 'manual').
sumd_workflow_step('setup', 1, 'echo "$(BLUE)Przygotowywanie środowiska...$(NC)"').
sumd_workflow_step('setup', 2, 'chmod +x setup.sh').
sumd_workflow_step('setup', 3, './setup.sh').
sumd_workflow_step('setup', 4, 'echo "$(GREEN)✓ Setup zakończony$(NC)"').
sumd_workflow('build', 'manual').
sumd_workflow_step('build', 1, 'echo "$(BLUE)Budowanie obrazów Docker z cache...$(NC)"').
sumd_workflow_step('build', 2, 'DOCKER_BUILDKIT=1 docker-compose build').
sumd_workflow_step('build', 3, 'echo "$(GREEN)✓ Obrazy zbudowane$(NC)"').
sumd_workflow('build-no-cache', 'manual').
sumd_workflow_step('build-no-cache', 1, 'echo "$(BLUE)Budowanie obrazów Docker bez cache...$(NC)"').
sumd_workflow_step('build-no-cache', 2, 'DOCKER_BUILDKIT=1 docker-compose build --no-cache').
sumd_workflow_step('build-no-cache', 3, 'echo "$(GREEN)✓ Obrazy zbudowane$(NC)"').
sumd_workflow('up', 'manual').
sumd_workflow_step('up', 1, 'echo "$(BLUE)Uruchamianie usług...$(NC)"').
sumd_workflow_step('up', 2, 'docker-compose up -d').
sumd_workflow_step('up', 3, 'echo "$(GREEN)✓ Usługi uruchomione$(NC)"').
sumd_workflow_step('up', 4, 'echo ""').
sumd_workflow_step('up', 5, 'echo "$(YELLOW)Poczekaj 30-60 sekund na pełne uruchomienie$(NC)"').
sumd_workflow_step('up', 6, 'echo ""').
sumd_workflow_step('up', 7, '$(MAKE) --no-print-directory info').
sumd_workflow('start', 'manual').
sumd_workflow('down', 'manual').
sumd_workflow_step('down', 1, 'echo "$(BLUE)Zatrzymywanie usług...$(NC)"').
sumd_workflow_step('down', 2, 'docker-compose down').
sumd_workflow_step('down', 3, 'echo "$(GREEN)✓ Usługi zatrzymane$(NC)"').
sumd_workflow('stop', 'manual').
sumd_workflow('restart', 'manual').
sumd_workflow('logs', 'manual').
sumd_workflow_step('logs', 1, 'docker-compose logs -f').
sumd_workflow('logs-vnc', 'manual').
sumd_workflow_step('logs-vnc', 1, 'docker-compose logs -f vnc-desktop').
sumd_workflow('logs-ollama', 'manual').
sumd_workflow_step('logs-ollama', 1, 'docker-compose logs -f ollama').
sumd_workflow('logs-controller', 'manual').
sumd_workflow_step('logs-controller', 1, 'docker-compose logs -f automation-controller').
sumd_workflow('shell', 'manual').
sumd_workflow_step('shell', 1, 'docker-compose exec automation-controller /bin/bash').
sumd_workflow('shell-vnc', 'manual').
sumd_workflow_step('shell-vnc', 1, 'docker-compose exec vnc-desktop /bin/bash').
sumd_workflow('test', 'manual').
sumd_workflow_step('test', 1, 'echo "$(BLUE)Uruchamianie testów...$(NC)"').
sumd_workflow_step('test', 2, 'python3 run_tests.py').
sumd_workflow('test-wait', 'manual').
sumd_workflow_step('test-wait', 1, 'echo "$(BLUE)Uruchamianie testów z czekaniem...$(NC)"').
sumd_workflow_step('test-wait', 2, 'python3 run_tests.py --wait').
sumd_workflow('test-basic', 'manual').
sumd_workflow_step('test-basic', 1, 'echo "$(BLUE)Test podstawowy...$(NC)"').
sumd_workflow_step('test-basic', 2, 'echo "$(YELLOW)⚠️  Ten test używa AI (Ollama) - może zająć 30-120s$(NC)"').
sumd_workflow_step('test-basic', 3, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_connection').
sumd_workflow('test-quick', 'manual').
sumd_workflow_step('test-quick', 1, 'echo "$(BLUE)Szybki test połączenia (5s)...$(NC)"').
sumd_workflow_step('test-quick', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/quick_test.yaml quick_connection_test --no-recording').
sumd_workflow('test-firefox', 'manual').
sumd_workflow_step('test-firefox', 1, 'echo "$(BLUE)Test Firefox...$(NC)"').
sumd_workflow_step('test-firefox', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_firefox').
sumd_workflow('test-firefox-simple', 'manual').
sumd_workflow_step('test-firefox-simple', 1, 'echo "$(BLUE)Test Firefox (simple)...$(NC)"').
sumd_workflow_step('test-firefox-simple', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_firefox_simple --no-recording').
sumd_workflow('test-firefox-ai', 'manual').
sumd_workflow_step('test-firefox-ai', 1, 'echo "$(BLUE)Test Firefox (AI)...$(NC)"').
sumd_workflow_step('test-firefox-ai', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_firefox_ai').
sumd_workflow('test-firefox-ai-debug', 'manual').
sumd_workflow_step('test-firefox-ai-debug', 1, 'echo "$(BLUE)Test Firefox AI (debug)...$(NC)"').
sumd_workflow_step('test-firefox-ai-debug', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_firefox_ai --debug --no-recording').
sumd_workflow('test-debug', 'manual').
sumd_workflow_step('test-debug', 1, 'echo "$(BLUE)Debug ekranu (AI Vision)...$(NC)"').
sumd_workflow_step('test-debug', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_debug_screen --debug --no-recording').
sumd_workflow('test-debug-screenshots', 'manual').
sumd_workflow_step('test-debug-screenshots', 1, 'echo "$(BLUE)Debug screenshotów (co 1s)...$(NC)"').
sumd_workflow_step('test-debug-screenshots', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_firefox_simple.yaml test_debug_screenshots --no-recording').
sumd_workflow_step('test-debug-screenshots', 3, 'echo "$(GREEN)✓ Screenshoty zapisane w: results/screenshots/$(NC)"').
sumd_workflow('test-ai-adaptive', 'manual').
sumd_workflow_step('test-ai-adaptive', 1, 'echo "$(BLUE)AI Test: Adaptacyjna nawigacja...$(NC)"').
sumd_workflow_step('test-ai-adaptive', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml adaptive_firefox_navigation --no-recording').
sumd_workflow('test-ai-search', 'manual').
sumd_workflow_step('test-ai-search', 1, 'echo "$(BLUE)AI Test: Smart search...$(NC)"').
sumd_workflow_step('test-ai-search', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml smart_search_and_select --no-recording').
sumd_workflow('test-ai-desktop-mapper', 'manual').
sumd_workflow_step('test-ai-desktop-mapper', 1, 'echo "$(BLUE)AI Test: Desktop mapper...$(NC)"').
sumd_workflow_step('test-ai-desktop-mapper', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml desktop_mapper --no-recording').
sumd_workflow('test-ai-monitor', 'manual').
sumd_workflow_step('test-ai-monitor', 1, 'echo "$(BLUE)AI Test: Application state monitor...$(NC)"').
sumd_workflow_step('test-ai-monitor', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml application_state_monitor --no-recording').
sumd_workflow('test-ai-editor', 'manual').
sumd_workflow_step('test-ai-editor', 1, 'echo "$(BLUE)AI Test: Text editing + validation...$(NC)"').
sumd_workflow_step('test-ai-editor', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml intelligent_text_editing --no-recording').
sumd_workflow('test-ai-files', 'manual').
sumd_workflow_step('test-ai-files', 1, 'echo "$(BLUE)AI Test: File navigation...$(NC)"').
sumd_workflow_step('test-ai-files', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml smart_file_navigation --no-recording').
sumd_workflow('test-ai-forms', 'manual').
sumd_workflow_step('test-ai-forms', 1, 'echo "$(BLUE)AI Test: Form interaction...$(NC)"').
sumd_workflow_step('test-ai-forms', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml smart_form_interaction --no-recording').
sumd_workflow('test-ai-errors', 'manual').
sumd_workflow_step('test-ai-errors', 1, 'echo "$(BLUE)AI Test: Error detection...$(NC)"').
sumd_workflow_step('test-ai-errors', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml intelligent_error_detection --no-recording').
sumd_workflow('test-ai-windows', 'manual').
sumd_workflow_step('test-ai-windows', 1, 'echo "$(BLUE)AI Test: Multi-window management...$(NC)"').
sumd_workflow_step('test-ai-windows', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml window_management_test --no-recording').
sumd_workflow('test-ai-visual', 'manual').
sumd_workflow_step('test-ai-visual', 1, 'echo "$(BLUE)AI Test: Visual regression...$(NC)"').
sumd_workflow_step('test-ai-visual', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml visual_change_detection --no-recording').
sumd_workflow('test-ai-performance', 'manual').
sumd_workflow_step('test-ai-performance', 1, 'echo "$(BLUE)AI Test: Performance monitor...$(NC)"').
sumd_workflow_step('test-ai-performance', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml ai_performance_monitor --no-recording').
sumd_workflow('test-ai-ui', 'manual').
sumd_workflow_step('test-ai-ui', 1, 'echo "$(BLUE)AI Test: UI validation...$(NC)"').
sumd_workflow_step('test-ai-ui', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml ui_validation_test --no-recording').
sumd_workflow('test-ai-commands', 'manual').
sumd_workflow_step('test-ai-commands', 1, 'echo "$(BLUE)AI Test: Command output analysis...$(NC)"').
sumd_workflow_step('test-ai-commands', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml command_output_analysis --no-recording').
sumd_workflow('test-ai-all', 'manual').
sumd_workflow_step('test-ai-all', 1, 'echo "$(YELLOW)⚠️  Uruchamianie wszystkich testów AI - to może zająć 10-30 minut!$(NC)"').
sumd_workflow_step('test-ai-all', 2, '$(MAKE) --no-print-directory test-ai-adaptive').
sumd_workflow_step('test-ai-all', 3, '$(MAKE) --no-print-directory test-ai-desktop-mapper').
sumd_workflow_step('test-ai-all', 4, '$(MAKE) --no-print-directory test-ai-monitor').
sumd_workflow_step('test-ai-all', 5, '$(MAKE) --no-print-directory test-ai-editor').
sumd_workflow_step('test-ai-all', 6, '$(MAKE) --no-print-directory test-ai-files').
sumd_workflow_step('test-ai-all', 7, '$(MAKE) --no-print-directory test-ai-errors').
sumd_workflow_step('test-ai-all', 8, '$(MAKE) --no-print-directory test-ai-windows').
sumd_workflow_step('test-ai-all', 9, '$(MAKE) --no-print-directory test-ai-visual').
sumd_workflow_step('test-ai-all', 10, '$(MAKE) --no-print-directory test-ai-performance').
sumd_workflow_step('test-ai-all', 11, '$(MAKE) --no-print-directory test-ai-ui').
sumd_workflow_step('test-ai-all', 12, '$(MAKE) --no-print-directory test-ai-commands').
sumd_workflow_step('test-ai-all', 13, 'echo "$(GREEN)✓ Wszystkie testy AI zakończone!$(NC)"').
sumd_workflow('list-ai-tests', 'manual').
sumd_workflow_step('list-ai-tests', 1, 'echo "$(BLUE)Dostępne testy AI:$(NC)"').
sumd_workflow_step('list-ai-tests', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_driven_tests.yaml dummy --list || true').
sumd_workflow('test-hybrid-performance', 'manual').
sumd_workflow_step('test-hybrid-performance', 1, 'echo "$(BLUE)Hybrid Test: Terminal performance...$(NC)"').
sumd_workflow_step('test-hybrid-performance', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml terminal_performance_analysis --no-recording').
sumd_workflow('test-hybrid-desktop', 'manual').
sumd_workflow_step('test-hybrid-desktop', 1, 'echo "$(BLUE)Hybrid Test: Desktop analysis...$(NC)"').
sumd_workflow_step('test-hybrid-desktop', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml desktop_visual_analysis --no-recording').
sumd_workflow('test-hybrid-firefox', 'manual').
sumd_workflow_step('test-hybrid-firefox', 1, 'echo "$(BLUE)Hybrid Test: Firefox analysis...$(NC)"').
sumd_workflow_step('test-hybrid-firefox', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml firefox_simple_analysis --no-recording').
sumd_workflow('test-hybrid-editor', 'manual').
sumd_workflow_step('test-hybrid-editor', 1, 'echo "$(BLUE)Hybrid Test: Text editor...$(NC)"').
sumd_workflow_step('test-hybrid-editor', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml text_editor_validation --no-recording').
sumd_workflow('test-hybrid-state', 'manual').
sumd_workflow_step('test-hybrid-state', 1, 'echo "$(BLUE)Hybrid Test: State monitoring...$(NC)"').
sumd_workflow_step('test-hybrid-state', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml system_state_comparison --no-recording').
sumd_workflow('test-hybrid-errors', 'manual').
sumd_workflow_step('test-hybrid-errors', 1, 'echo "$(BLUE)Hybrid Test: Error analysis...$(NC)"').
sumd_workflow_step('test-hybrid-errors', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml error_message_analysis --no-recording').
sumd_workflow('test-hybrid-commands', 'manual').
sumd_workflow_step('test-hybrid-commands', 1, 'echo "$(BLUE)Hybrid Test: Command parsing...$(NC)"').
sumd_workflow_step('test-hybrid-commands', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml command_parsing_test --no-recording').
sumd_workflow('test-hybrid-accessibility', 'manual').
sumd_workflow_step('test-hybrid-accessibility', 1, 'echo "$(BLUE)Hybrid Test: Accessibility...$(NC)"').
sumd_workflow_step('test-hybrid-accessibility', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml ui_accessibility_test --no-recording').
sumd_workflow('test-hybrid-windows', 'manual').
sumd_workflow_step('test-hybrid-windows', 1, 'echo "$(BLUE)Hybrid Test: Window stress...$(NC)"').
sumd_workflow_step('test-hybrid-windows', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml window_stress_test --no-recording').
sumd_workflow('test-hybrid-all', 'manual').
sumd_workflow_step('test-hybrid-all', 1, 'echo "$(YELLOW)⚠️  Uruchamianie wszystkich hybrid testów - może zająć 10-20 minut!$(NC)"').
sumd_workflow_step('test-hybrid-all', 2, '$(MAKE) --no-print-directory test-hybrid-performance').
sumd_workflow_step('test-hybrid-all', 3, '$(MAKE) --no-print-directory test-hybrid-desktop').
sumd_workflow_step('test-hybrid-all', 4, '$(MAKE) --no-print-directory test-hybrid-firefox').
sumd_workflow_step('test-hybrid-all', 5, '$(MAKE) --no-print-directory test-hybrid-editor').
sumd_workflow_step('test-hybrid-all', 6, '$(MAKE) --no-print-directory test-hybrid-state').
sumd_workflow_step('test-hybrid-all', 7, '$(MAKE) --no-print-directory test-hybrid-errors').
sumd_workflow_step('test-hybrid-all', 8, '$(MAKE) --no-print-directory test-hybrid-commands').
sumd_workflow_step('test-hybrid-all', 9, '$(MAKE) --no-print-directory test-hybrid-accessibility').
sumd_workflow_step('test-hybrid-all', 10, '$(MAKE) --no-print-directory test-hybrid-windows').
sumd_workflow_step('test-hybrid-all', 11, 'echo "$(GREEN)✓ Wszystkie hybrid testy zakończone!$(NC)"').
sumd_workflow('list-hybrid-tests', 'manual').
sumd_workflow_step('list-hybrid-tests', 1, 'echo "$(BLUE)Dostępne hybrid testy:$(NC)"').
sumd_workflow_step('list-hybrid-tests', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/ai_hybrid_tests.yaml dummy --list || true').
sumd_workflow('test-auto-login', 'manual').
sumd_workflow_step('test-auto-login', 1, 'echo "$(BLUE)Auto Login: Smart detection (AI - slow)...$(NC)"').
sumd_workflow_step('test-auto-login', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml smart_login_detection --no-recording').
sumd_workflow('test-auto-login-cv', 'manual').
sumd_workflow_step('test-auto-login-cv', 1, 'echo "$(BLUE)Auto Login: CV Fast (milliseconds)...$(NC)"').
sumd_workflow_step('test-auto-login-cv', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml cv_fast_login --no-recording').
sumd_workflow('test-auto-login-retry', 'manual').
sumd_workflow_step('test-auto-login-retry', 1, 'echo "$(BLUE)Auto Login: With retry...$(NC)"').
sumd_workflow_step('test-auto-login-retry', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml advanced_login_with_retry --no-recording').
sumd_workflow('test-system-login', 'manual').
sumd_workflow_step('test-system-login', 1, 'echo "$(BLUE)Auto Login: System login...$(NC)"').
sumd_workflow_step('test-system-login', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml system_user_login --no-recording').
sumd_workflow('test-app-login', 'manual').
sumd_workflow_step('test-app-login', 1, 'echo "$(BLUE)Auto Login: Application login...$(NC)"').
sumd_workflow_step('test-app-login', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml application_login_handler --no-recording').
sumd_workflow('test-password-manager', 'manual').
sumd_workflow_step('test-password-manager', 1, 'echo "$(BLUE)Auto Login: Smart password manager...$(NC)"').
sumd_workflow_step('test-password-manager', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml smart_password_manager --no-recording').
sumd_workflow('test-multi-login', 'manual').
sumd_workflow_step('test-multi-login', 1, 'echo "$(BLUE)Auto Login: Multi-stage login...$(NC)"').
sumd_workflow_step('test-multi-login', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml multi_stage_login --no-recording').
sumd_workflow('list-auto-login', 'manual').
sumd_workflow_step('list-auto-login', 1, 'echo "$(BLUE)Dostępne testy auto-login:$(NC)"').
sumd_workflow_step('list-auto-login', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/auto_login.yaml dummy --list || true').
sumd_workflow('test-cv-speed', 'manual').
sumd_workflow_step('test-cv-speed', 1, 'echo "$(BLUE)CV Test: Fast detection (milliseconds)...$(NC)"').
sumd_workflow_step('test-cv-speed', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml cv_fast_detection --no-recording').
sumd_workflow('test-cv-unlock', 'manual').
sumd_workflow_step('test-cv-unlock', 1, 'echo "$(BLUE)CV Test: Fast unlock...$(NC)"').
sumd_workflow_step('test-cv-unlock', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml cv_fast_unlock --no-recording').
sumd_workflow('test-cv-auto-login', 'manual').
sumd_workflow_step('test-cv-auto-login', 1, 'echo "$(BLUE)CV Test: Auto-login complete...$(NC)"').
sumd_workflow_step('test-cv-auto-login', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml cv_auto_login_complete --no-recording').
sumd_workflow('test-cv-vs-ai', 'manual').
sumd_workflow_step('test-cv-vs-ai', 1, 'echo "$(BLUE)Speed Benchmark: CV vs AI...$(NC)"').
sumd_workflow_step('test-cv-vs-ai', 2, 'echo "$(YELLOW)⚠️  This will take ~1min (AI is slow)$(NC)"').
sumd_workflow_step('test-cv-vs-ai', 3, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml speed_benchmark --no-recording').
sumd_workflow('list-cv-tests', 'manual').
sumd_workflow_step('list-cv-tests', 1, 'echo "$(BLUE)Dostępne testy CV:$(NC)"').
sumd_workflow_step('list-cv-tests', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/cv_speed_test.yaml dummy --list || true').
sumd_workflow('test-diag-screen', 'manual').
sumd_workflow_step('test-diag-screen', 1, 'echo "$(BLUE)Diagnostics: Screen check...$(NC)"').
sumd_workflow_step('test-diag-screen', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml screen_diagnostics --no-recording').
sumd_workflow('test-diag-vnc', 'manual').
sumd_workflow_step('test-diag-vnc', 1, 'echo "$(BLUE)Diagnostics: VNC connection check...$(NC)"').
sumd_workflow_step('test-diag-vnc', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml vnc_connection_check --no-recording').
sumd_workflow('test-diag-lock', 'manual').
sumd_workflow_step('test-diag-lock', 1, 'echo "$(BLUE)Diagnostics: Lock screen detection...$(NC)"').
sumd_workflow_step('test-diag-lock', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml lock_screen_detection --no-recording').
sumd_workflow('test-diag-ready', 'manual').
sumd_workflow_step('test-diag-ready', 1, 'echo "$(BLUE)Diagnostics: Desktop ready check...$(NC)"').
sumd_workflow_step('test-diag-ready', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml desktop_ready_check --no-recording').
sumd_workflow('test-diag-full', 'manual').
sumd_workflow_step('test-diag-full', 1, 'echo "$(BLUE)Diagnostics: Full system check...$(NC)"').
sumd_workflow_step('test-diag-full', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml full_system_check --no-recording').
sumd_workflow('test-diag-recovery', 'manual').
sumd_workflow_step('test-diag-recovery', 1, 'echo "$(BLUE)Diagnostics: Auto-recovery...$(NC)"').
sumd_workflow_step('test-diag-recovery', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml auto_recovery --no-recording').
sumd_workflow('list-diag-tests', 'manual').
sumd_workflow_step('list-diag-tests', 1, 'echo "$(BLUE)Dostępne testy diagnostyczne:$(NC)"').
sumd_workflow_step('list-diag-tests', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/diagnostics.yaml dummy --list || true').
sumd_workflow('live-monitor', 'manual').
sumd_workflow_step('live-monitor', 1, 'echo "$(BLUE)Starting Live Automation Monitor...$(NC)"').
sumd_workflow_step('live-monitor', 2, 'echo "$(GREEN)📺 Open: http://localhost:5000$(NC)"').
sumd_workflow_step('live-monitor', 3, 'echo ""').
sumd_workflow_step('live-monitor', 4, 'docker-compose exec -T automation-controller python3 /app/live_monitor.py').
sumd_workflow('test-terminal', 'manual').
sumd_workflow_step('test-terminal', 1, 'echo "$(BLUE)Test terminala...$(NC)"').
sumd_workflow_step('test-terminal', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_terminal').
sumd_workflow('test-no-recording', 'manual').
sumd_workflow_step('test-no-recording', 1, 'echo "$(BLUE)Test bez nagrywania...$(NC)"').
sumd_workflow_step('test-no-recording', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml test_connection --no-recording').
sumd_workflow('list-scenarios', 'manual').
sumd_workflow_step('list-scenarios', 1, 'echo "$(BLUE)Dostępne scenariusze:$(NC)"').
sumd_workflow_step('list-scenarios', 2, 'docker-compose exec automation-controller python3 /app/run_scenario.py /app/test_scenarios/test_basic.yaml dummy --list || true').
sumd_workflow('interactive', 'manual').
sumd_workflow_step('interactive', 1, 'docker-compose exec automation-controller python3 automation_cli.py test_scenarios/test_basic.yaml --interactive').
sumd_workflow('status', 'manual').
sumd_workflow_step('status', 1, 'echo "$(BLUE)Status usług:$(NC)"').
sumd_workflow_step('status', 2, 'docker-compose ps').
sumd_workflow_step('status', 3, 'echo ""').
sumd_workflow_step('status', 4, 'echo "$(BLUE)Testy połączeń:$(NC)"').
sumd_workflow_step('status', 5, 'echo -n "VNC (5901): "').
sumd_workflow_step('status', 6, 'nc -z -w2 localhost 5901 && echo "$(GREEN)✓ Działa$(NC)" || echo "$(RED)✗ Nie działa$(NC)"').
sumd_workflow_step('status', 7, 'echo -n "noVNC (6080): "').
sumd_workflow_step('status', 8, 'nc -z -w2 localhost 6080 && echo "$(GREEN)✓ Działa$(NC)" || echo "$(RED)✗ Nie działa$(NC)"').
sumd_workflow_step('status', 9, 'echo -n "Ollama (11434): "').
sumd_workflow_step('status', 10, 'nc -z -w2 localhost 11434 && echo "$(GREEN)✓ Działa$(NC)" || echo "$(RED)✗ Nie działa$(NC)"').
sumd_workflow('info', 'manual').
sumd_workflow_step('info', 1, 'echo ""').
sumd_workflow_step('info', 2, 'echo "$(GREEN)═══════════════════════════════════════════$(NC)"').
sumd_workflow_step('info', 3, 'echo "$(GREEN)  Remote Automation Environment$(NC)"').
sumd_workflow_step('info', 4, 'echo "$(GREEN)═══════════════════════════════════════════$(NC)"').
sumd_workflow_step('info', 5, 'echo ""').
sumd_workflow_step('info', 6, 'echo "$(YELLOW)📺 VNC Desktop:$(NC)"').
sumd_workflow_step('info', 7, 'echo "   VNC Client: localhost:5901 (hasło: automation)"').
sumd_workflow_step('info', 8, 'echo "   Przeglądarka: $(BLUE)http://localhost:6080/vnc.html$(NC)"').
sumd_workflow_step('info', 9, 'echo ""').
sumd_workflow_step('info', 10, 'echo "$(YELLOW)🤖 Ollama API:$(NC)"').
sumd_workflow_step('info', 11, 'echo "   URL: $(BLUE)http://localhost:11434$(NC)"').
sumd_workflow_step('info', 12, 'echo ""').
sumd_workflow_step('info', 13, 'echo "$(YELLOW)📊 Portainer:$(NC)"').
sumd_workflow_step('info', 14, 'echo "   URL: $(BLUE)http://localhost:9000$(NC)"').
sumd_workflow_step('info', 15, 'echo ""').
sumd_workflow_step('info', 16, 'echo "$(YELLOW)🧪 Szybkie testy:$(NC)"').
sumd_workflow_step('info', 17, 'echo "   make test-quick          - Szybki test (BEZ AI, 5s)"').
sumd_workflow_step('info', 18, 'echo "   make test-debug          - Debug ekranu (co widzi AI)"').
sumd_workflow_step('info', 19, 'echo "   make test-debug-screenshots - Screenshoty co 1s (5s)"').
sumd_workflow_step('info', 20, 'echo "   make test-firefox-simple - Firefox (BEZ AI)"').
sumd_workflow_step('info', 21, 'echo "   make test-firefox-ai-debug - Firefox AI + screenshoty"').
sumd_workflow_step('info', 22, 'echo "   make test-basic          - Podstawowy test (z AI, 30-60s)"').
sumd_workflow_step('info', 23, 'echo "   make test                - Pełny test suite"').
sumd_workflow_step('info', 24, 'echo ""').
sumd_workflow_step('info', 25, 'echo "$(YELLOW)🤖 Testy AI-Driven:$(NC)"').
sumd_workflow_step('info', 26, 'echo "   make list-ai-tests       - Lista wszystkich testów AI"').
sumd_workflow_step('info', 27, 'echo "   make test-ai-adaptive    - Adaptacyjna nawigacja Firefox"').
sumd_workflow_step('info', 28, 'echo "   make test-ai-desktop-mapper - AI mapuje pulpit"').
sumd_workflow_step('info', 29, 'echo "   make test-ai-monitor     - Monitor stanu aplikacji"').
sumd_workflow_step('info', 30, 'echo "   make test-ai-editor      - Inteligentna edycja tekstu"').
sumd_workflow_step('info', 31, 'echo "   make test-ai-errors      - Detekcja i diagnoza błędów"').
sumd_workflow_step('info', 32, 'echo "   make test-ai-performance - Monitoring wydajności systemu"').
sumd_workflow_step('info', 33, 'echo "   make test-ai-all         - Wszystkie testy AI (10-30min)"').
sumd_workflow_step('info', 34, 'echo ""').
sumd_workflow_step('info', 35, 'echo "$(YELLOW)🔀 Testy Hybrid (AI + Niezawodne akcje):$(NC)"').
sumd_workflow_step('info', 36, 'echo "   make list-hybrid-tests   - Lista hybrid testów"').
sumd_workflow_step('info', 37, 'echo "   make test-hybrid-performance - Terminal performance"').
sumd_workflow_step('info', 38, 'echo "   make test-hybrid-desktop - Analiza pulpitu"').
sumd_workflow_step('info', 39, 'echo "   make test-hybrid-errors  - Analiza błędów"').
sumd_workflow_step('info', 40, 'echo "   make test-hybrid-commands - Parsing komend"').
sumd_workflow_step('info', 41, 'echo "   make test-hybrid-all     - Wszystkie hybrid (10-20min)"').
sumd_workflow_step('info', 42, 'echo ""').
sumd_workflow_step('info', 43, 'echo "$(YELLOW)🔐 Auto-Login (Wykrywanie i wypełnianie):$(NC)"').
sumd_workflow_step('info', 44, 'echo "   make list-auto-login     - Lista testów logowania"').
sumd_workflow_step('info', 45, 'echo "   make test-auto-login-cv  - CV Fast login (milisekundy!) ⚡"').
sumd_workflow_step('info', 46, 'echo "   make test-auto-login     - AI detection (wolne ~60s)"').
sumd_workflow_step('info', 47, 'echo "   make test-system-login   - Logowanie do systemu"').
sumd_workflow_step('info', 48, 'echo "   make test-app-login      - Logowanie do aplikacji"').
sumd_workflow_step('info', 49, 'echo "   make test-password-manager - Smart password manager"').
sumd_workflow_step('info', 50, 'echo "   make test-multi-login    - Multi-stage login"').
sumd_workflow_step('info', 51, 'echo ""').
sumd_workflow_step('info', 52, 'echo "$(YELLOW)⚡ CV Detection (100x szybsze niż AI!):$(NC)"').
sumd_workflow_step('info', 53, 'echo "   make list-cv-tests       - Lista testów CV"').
sumd_workflow_step('info', 54, 'echo "   make test-cv-speed       - Fast detection (milisekundy!)"').
sumd_workflow_step('info', 55, 'echo "   make test-cv-unlock      - Fast unlock screen"').
sumd_workflow_step('info', 56, 'echo "   make test-cv-auto-login  - Complete auto-login (super fast)"').
sumd_workflow_step('info', 57, 'echo "   make test-cv-vs-ai       - Speed benchmark: CV vs AI"').
sumd_workflow_step('info', 58, 'echo ""').
sumd_workflow_step('info', 59, 'echo "$(YELLOW)🔍 Diagnostics (Sprawdzanie problemów):$(NC)"').
sumd_workflow_step('info', 60, 'echo "   make list-diag-tests     - Lista testów diagnostycznych"').
sumd_workflow_step('info', 61, 'echo "   make test-diag-screen    - Sprawdź stan ekranu"').
sumd_workflow_step('info', 62, 'echo "   make test-diag-vnc       - Sprawdź połączenie VNC"').
sumd_workflow_step('info', 63, 'echo "   make test-diag-lock      - Wykryj lock screen"').
sumd_workflow_step('info', 64, 'echo "   make test-diag-ready     - Czy desktop gotowy?"').
sumd_workflow_step('info', 65, 'echo "   make test-diag-full      - Pełne sprawdzenie (CV+AI)"').
sumd_workflow_step('info', 66, 'echo "   make test-diag-recovery  - Auto-recovery (odblokuj)"').
sumd_workflow_step('info', 67, 'echo ""').
sumd_workflow_step('info', 68, 'echo "$(YELLOW)🎬 Live Monitor (Web Interface):$(NC)"').
sumd_workflow_step('info', 69, 'echo "   make live-monitor        - Uruchom web monitoring (http://localhost:5000)"').
sumd_workflow_step('info', 70, 'echo "   Features: Live VNC preview + step list + real-time updates"').
sumd_workflow_step('info', 71, 'echo ""').
sumd_workflow_step('info', 72, 'echo "$(YELLOW)🎬 Nagrania testów:$(NC)"').
sumd_workflow_step('info', 73, 'echo "   Lokalizacja: $(BLUE)results/videos/$(NC)"').
sumd_workflow_step('info', 74, 'echo "   Format: MP4 (10 fps)"').
sumd_workflow_step('info', 75, 'echo ""').
sumd_workflow_step('info', 76, 'echo "$(YELLOW)📚 Więcej komend:$(NC)"').
sumd_workflow_step('info', 77, 'echo "   make help          - Pełna lista komend"').
sumd_workflow_step('info', 78, 'echo ""').
sumd_workflow('vnc', 'manual').
sumd_workflow_step('vnc', 1, 'echo "$(BLUE)Otwieranie VNC w przeglądarce...$(NC)"').
sumd_workflow_step('vnc', 2, 'command -v xdg-open >/dev/null 2>&1 && xdg-open http://localhost:6080/vnc.html || open http://localhost:6080/vnc.html').
sumd_workflow('ps', 'manual').
sumd_workflow('pull-model', 'manual').
sumd_workflow_step('pull-model', 1, 'echo "$(BLUE)Pobieranie modelu llava:7b...$(NC)"').
sumd_workflow_step('pull-model', 2, 'docker-compose exec ollama ollama pull llava:7b').
sumd_workflow_step('pull-model', 3, 'echo "$(GREEN)✓ Model pobrany$(NC)"').
sumd_workflow('pull-model-small', 'manual').
sumd_workflow_step('pull-model-small', 1, 'echo "$(BLUE)Pobieranie modelu moondream...$(NC)"').
sumd_workflow_step('pull-model-small', 2, 'docker-compose exec ollama ollama pull moondream').
sumd_workflow_step('pull-model-small', 3, 'echo "$(GREEN)✓ Model pobrany$(NC)"').
sumd_workflow('list-models', 'manual').
sumd_workflow_step('list-models', 1, 'echo "$(BLUE)Zainstalowane modele:$(NC)"').
sumd_workflow_step('list-models', 2, 'docker-compose exec ollama ollama list').
sumd_workflow('clean', 'manual').
sumd_workflow_step('clean', 1, 'echo "$(BLUE)Usuwanie kontenerów...$(NC)"').
sumd_workflow_step('clean', 2, 'docker-compose down').
sumd_workflow_step('clean', 3, 'echo "$(GREEN)✓ Kontenery usunięte$(NC)"').
sumd_workflow('clean-all', 'manual').
sumd_workflow_step('clean-all', 1, 'echo "$(RED)Usuwanie wszystkiego (włącznie z danymi)...$(NC)"').
sumd_workflow_step('clean-all', 2, 'read -p "Czy na pewno? [y/N] " -n 1 -r').
sumd_workflow_step('clean-all', 3, 'echo').
sumd_workflow_step('clean-all', 4, 'if [[ $$REPLY =~ ^[Yy]$$ ]]').
sumd_workflow_step('clean-all', 5, 'docker-compose down -v --rmi local').
sumd_workflow_step('clean-all', 6, 'echo "$(GREEN)✓ Wszystko usunięte$(NC)"').
sumd_workflow_step('clean-all', 7, 'else \').
sumd_workflow_step('clean-all', 8, 'echo "$(YELLOW)Anulowano$(NC)"').
sumd_workflow_step('clean-all', 9, 'fi').
sumd_workflow('clean-cache', 'manual').
sumd_workflow_step('clean-cache', 1, 'echo "$(BLUE)Usuwanie cache Docker...$(NC)"').
sumd_workflow_step('clean-cache', 2, 'docker volume rm -f remote-automation_pip-cache remote-automation_apt-cache 2>/dev/null || true').
sumd_workflow_step('clean-cache', 3, 'docker builder prune -f').
sumd_workflow_step('clean-cache', 4, 'echo "$(GREEN)✓ Cache usunięty$(NC)"').
sumd_workflow('volumes', 'manual').
sumd_workflow_step('volumes', 1, 'echo "$(BLUE)Status volumes:$(NC)"').
sumd_workflow_step('volumes', 2, 'echo ""').
sumd_workflow_step('volumes', 3, 'echo "$(YELLOW)Ollama modele:$(NC)"').
sumd_workflow('models', 'manual').
sumd_workflow_step('models', 1, 'echo "$(BLUE)Zainstalowane modele Ollama:$(NC)"').
sumd_workflow_step('models', 2, 'docker-compose exec ollama ollama list 2>/dev/null || echo "Ollama nie działa"').
sumd_workflow('backup-results', 'manual').
sumd_workflow_step('backup-results', 1, 'echo "$(BLUE)Tworzenie backup wyników...$(NC)"').
sumd_workflow_step('backup-results', 2, 'mkdir -p backups').
sumd_workflow_step('backup-results', 3, 'tar -czf backups/results-$$(date +%Y%m%d-%H%M%S).tar.gz results/').
sumd_workflow_step('backup-results', 4, 'echo "$(GREEN)✓ Backup utworzony$(NC)"').
sumd_workflow('backup-models', 'manual').
sumd_workflow_step('backup-models', 1, 'echo "$(BLUE)Tworzenie backup modeli Ollama...$(NC)"').
sumd_workflow_step('backup-models', 2, 'mkdir -p backups').
sumd_workflow_step('backup-models', 3, 'docker run --rm -v remote-automation_ollama-data:/data -v $$(pwd)/backups:/backup alpine tar czf /backup/ollama-models-$$(date +%Y%m%d-%H%M%S).tar.gz -C /data .').
sumd_workflow_step('backup-models', 4, 'echo "$(GREEN)✓ Backup modeli utworzony$(NC)"').
sumd_workflow('restore-models', 'manual').
sumd_workflow_step('restore-models', 1, 'echo "$(BLUE)Dostępne backupy modeli:$(NC)"').
sumd_workflow_step('restore-models', 2, 'ls -la backups/ollama-models-*.tar.gz 2>/dev/null || echo "Brak backupów modeli"').
sumd_workflow_step('restore-models', 3, 'echo ""').
sumd_workflow_step('restore-models', 4, 'echo "$(YELLOW)Aby przywrócić, użyj: docker run --rm -v remote-automation_ollama-data:/data -v \$$(pwd)/backups:/backup alpine tar xzf /backup/NAZWA_PLIKU.tar.gz -C /data$(NC)"').
sumd_workflow('install-deps', 'manual').
sumd_workflow_step('install-deps', 1, 'echo "$(BLUE)Instalowanie zależności...$(NC)"').
sumd_workflow_step('install-deps', 2, 'pip3 install pillow requests pynput PyYAML vncdotool pytest').
sumd_workflow_step('install-deps', 3, 'echo "$(GREEN)✓ Zależności zainstalowane$(NC)"').
sumd_workflow('check-docker', 'manual').
sumd_workflow_step('check-docker', 1, 'echo "$(BLUE)Sprawdzanie Docker...$(NC)"').
sumd_workflow_step('check-docker', 2, 'docker --version && echo "$(GREEN)✓ Docker OK$(NC)" || echo "$(RED)✗ Docker nie znaleziony$(NC)"').
sumd_workflow_step('check-docker', 3, 'docker-compose --version 2>/dev/null && echo "$(GREEN)✓ Docker Compose OK$(NC)" || \').
sumd_workflow_step('check-docker', 4, '(docker compose version >/dev/null 2>&1 && echo "$(GREEN)✓ Docker Compose (plugin) OK$(NC)" || echo "$(RED)✗ Docker Compose nie znaleziony$(NC)")').
sumd_workflow('dev', 'manual').
sumd_workflow('quick', 'manual').
sumd_workflow_step('quick', 1, '$(MAKE) --no-print-directory up').
sumd_workflow_step('quick', 2, 'sleep 5').
sumd_workflow_step('quick', 3, '$(MAKE) --no-print-directory info').
sumd_deploy_target('docker_compose').
sumd_deploy_compose_file('docker-compose.yml').

