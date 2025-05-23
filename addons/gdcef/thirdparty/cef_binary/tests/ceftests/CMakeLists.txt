# Copyright (c) 2014 The Chromium Embedded Framework Authors. All rights
# reserved. Use of this source code is governed by a BSD-style license that
# can be found in the LICENSE file.

#
# Source files.
#

# ceftests sources.
set(CEFTESTS_SRCS
  audio_output_unittest.cc
  browser_info_map_unittest.cc
  certificate_error_unittest.cc
  client_app_delegates.cc
  command_line_unittest.cc
  cookie_unittest.cc
  cors_unittest.cc
  devtools_message_unittest.cc
  dialog_unittest.cc
  display_unittest.cc
  dom_unittest.cc
  download_unittest.cc
  draggable_regions_unittest.cc
  file_util_unittest.cc
  frame_handler_unittest.cc
  frame_unittest.cc
  hsts_redirect_unittest.cc
  image_unittest.cc
  image_util.cc
  image_util.h
  jsdialog_unittest.cc
  life_span_unittest.cc
  media_access_unittest.cc
  message_router_binary_unittest.cc
  message_router_harness_unittest.cc
  message_router_multi_query_unittest.cc
  message_router_single_query_unittest.cc
  message_router_threshold_unittest.cc
  message_router_unittest_utils.cc
  message_router_unittest_utils.h
  navigation_unittest.cc
  os_rendering_unittest.cc
  osr_accessibility_unittest.cc
  osr_display_unittest.cc
  parser_unittest.cc
  pdf_viewer_unittest.cc
  permission_prompt_unittest.cc
  preference_unittest.cc
  print_unittest.cc
  process_message_unittest.cc
  request_context_unittest.cc
  request_handler_unittest.cc
  request_unittest.cc
  resource.h
  resource_manager_unittest.cc
  resource_request_handler_unittest.cc
  response_unittest.cc
  routing_test_handler.cc
  routing_test_handler.h
  run_all_unittests.cc
  scheme_handler_unittest.cc
  scoped_temp_dir_unittest.cc
  send_shared_process_message_unittest.cc
  server_unittest.cc
  shared_process_message_unittest.cc
  stream_resource_handler_unittest.cc
  stream_unittest.cc
  string_unittest.cc
  task_unittest.cc
  test_handler.cc
  test_handler.h
  test_request.cc
  test_request.h
  test_server.cc
  test_server.h
  test_server_manager.cc
  test_server_manager.h
  test_server_observer.cc
  test_server_observer.h
  test_server_observer_unittest.cc
  test_server_runner.cc
  test_server_runner.h
  test_server_runner_normal.cc
  test_server_runner_test.cc
  test_server_unittest.cc
  test_suite.cc
  test_suite.h
  test_util.cc
  test_util.h
  thread_helper.cc
  thread_helper.h
  thread_unittest.cc
  time_unittest.cc
  tracing_unittest.cc
  track_callback.h
  translator_unittest.cc
  urlrequest_unittest.cc
  v8_unittest.cc
  values_unittest.cc
  version_unittest.cc
  waitable_event_unittest.cc
  webui_unittest.cc
  xml_reader_unittest.cc
  zip_reader_unittest.cc
  )
set(CEFTESTS_SRCS_LINUX
  resource_util_linux.cc
  )
set(CEFTESTS_SRCS_MAC
  os_rendering_unittest_mac.h
  os_rendering_unittest_mac.mm
  run_all_unittests_mac.mm
  )
set(CEFTESTS_SRCS_WINDOWS
  resource_util_win_dir.cc
  resource_util_win_idmap.cc
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_SRCS)
source_group(ceftests FILES ${CEFTESTS_SRCS})

set(CEFTESTS_SHARED_BROWSER_SRCS
  ../shared/browser/client_app_browser.cc
  ../shared/browser/client_app_browser.h
  ../shared/browser/file_util.cc
  ../shared/browser/file_util.h
  ../shared/browser/geometry_util.cc
  ../shared/browser/geometry_util.h
  ../shared/browser/main_message_loop.cc
  ../shared/browser/main_message_loop.h
  ../shared/browser/main_message_loop_external_pump.cc
  ../shared/browser/main_message_loop_external_pump.h
  ../shared/browser/main_message_loop_std.cc
  ../shared/browser/main_message_loop_std.h
  ../shared/browser/resource_util.h
  )
set(CEFTESTS_SHARED_BROWSER_SRCS_LINUX
  ../shared/browser/main_message_loop_external_pump_linux.cc
  ../shared/browser/resource_util_posix.cc
  )
set(CEFTESTS_SHARED_BROWSER_SRCS_MAC
  ../shared/browser/main_message_loop_external_pump_mac.mm
  ../shared/browser/resource_util_mac.mm
  ../shared/browser/resource_util_posix.cc
  )
set(CEFTESTS_SHARED_BROWSER_SRCS_WINDOWS
  ../shared/browser/main_message_loop_external_pump_win.cc
  ../shared/browser/resource_util_win.cc
  ../shared/browser/util_win.cc
  ../shared/browser/util_win.h
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_SHARED_BROWSER_SRCS)
source_group(shared\\\\browser FILES ${CEFTESTS_SHARED_BROWSER_SRCS})

set(CEFTESTS_SHARED_COMMON_SRCS
  ../shared/common/binary_value_utils.cc
  ../shared/common/binary_value_utils.h
  ../shared/common/client_app.cc
  ../shared/common/client_app.h
  ../shared/common/client_app_other.cc
  ../shared/common/client_app_other.h
  ../shared/common/client_switches.cc
  ../shared/common/client_switches.h
  ../shared/common/string_util.cc
  ../shared/common/string_util.h
  )
source_group(shared\\\\common FILES ${CEFTESTS_SHARED_COMMON_SRCS})

set(CEFTESTS_SHARED_RENDERER_SRCS_LINUX
  ../shared/renderer/client_app_renderer.cc
  ../shared/renderer/client_app_renderer.h
  )
set(CEFTESTS_SHARED_RENDERER_SRCS_WINDOWS
  ../shared/renderer/client_app_renderer.cc
  ../shared/renderer/client_app_renderer.h
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_SHARED_RENDERER_SRCS)
source_group(shared\\\\renderer FILES ${CEFTESTS_SHARED_RENDERER_SRCS})

set(CEFTESTS_VIEWS_SRCS
  views/button_unittest.cc
  views/panel_unittest.cc
  views/scroll_view_unittest.cc
  views/test_window_delegate.cc
  views/test_window_delegate.h
  views/textfield_unittest.cc
  views/window_unittest.cc
  )
source_group(ceftests\\\\views FILES ${CEFTESTS_VIEWS_SRCS})

set(CEFTESTS_WIN_SRCS_WINDOWS
  win/ceftests.rc
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_WIN_SRCS)
source_group(ceftests\\\\win FILES ${CEFTESTS_WIN_SRCS})

set(UNITTESTS_SRCS
  ${CEFTESTS_SRCS}
  ${CEFTESTS_SHARED_BROWSER_SRCS}
  ${CEFTESTS_SHARED_COMMON_SRCS}
  ${CEFTESTS_SHARED_RENDERER_SRCS}
  ${CEFTESTS_VIEWS_SRCS}
  ${CEFTESTS_WIN_SRCS}
  )

# ceftests helper sources.
set(CEFTESTS_HELPER_SRCS_MAC
  audio_output_unittest.cc
  client_app_delegates.cc
  cookie_unittest.cc
  cors_unittest.cc
  dom_unittest.cc
  frame_unittest.cc
  media_access_unittest.cc
  message_router_binary_unittest.cc
  message_router_harness_unittest.cc
  message_router_multi_query_unittest.cc
  message_router_single_query_unittest.cc
  message_router_threshold_unittest.cc
  message_router_unittest_utils.cc
  message_router_unittest_utils.h
  navigation_unittest.cc
  pdf_viewer_unittest.cc
  permission_prompt_unittest.cc
  preference_unittest.cc
  process_message_unittest.cc
  request_handler_unittest.cc
  request_unittest.cc
  resource_request_handler_unittest.cc
  response_unittest.cc
  routing_test_handler.cc
  routing_test_handler.h
  scheme_handler_unittest.cc
  send_shared_process_message_unittest.cc
  shared_process_message_unittest.cc
  test_handler.cc
  test_handler.h
  test_request.cc
  test_request.h
  test_server.cc
  test_server.h
  test_server_manager.cc
  test_server_manager.h
  test_server_observer.cc
  test_server_observer.h
  test_server_runner.cc
  test_server_runner.h
  test_server_runner_normal.cc
  test_server_runner_test.cc
  test_suite.cc
  test_suite.h
  test_util.cc
  test_util.h
  thread_helper.cc
  thread_helper.h
  thread_unittest.cc
  tracing_unittest.cc
  track_callback.h
  urlrequest_unittest.cc
  v8_unittest.cc
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_HELPER_SRCS)
source_group(ceftests FILES ${CEFTESTS_HELPER_SRCS})

set(CEFTESTS_HELPER_SHARED_SRCS_MAC
  ../shared/process_helper_mac.cc
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_HELPER_SHARED_SRCS)
source_group(shared FILES ${CEFTESTS_HELPER_SHARED_SRCS})

set(CEFTESTS_HELPER_SHARED_BROWSER_SRCS_MAC
  ../shared/browser/client_app_browser.h
  ../shared/browser/file_util.cc
  ../shared/browser/file_util.h
  ../shared/browser/resource_util.h
  ../shared/browser/resource_util_mac.mm
  ../shared/browser/resource_util_posix.cc
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_HELPER_SHARED_BROWSER_SRCS)
source_group(shared\\\\browser FILES ${CEFTESTS_HELPER_SHARED_BROWSER_SRCS})

set(CEFTESTS_HELPER_SHARED_COMMON_SRCS
  ../shared/common/binary_value_utils.cc
  ../shared/common/binary_value_utils.h
  ../shared/common/client_app.cc
  ../shared/common/client_app.h
  ../shared/common/client_app_other.cc
  ../shared/common/client_app_other.h
  ../shared/common/client_switches.cc
  ../shared/common/client_switches.h
  ../shared/common/string_util.cc
  ../shared/common/string_util.h
  )
source_group(shared\\\\common FILES ${CEFTESTS_HELPER_SHARED_COMMON_SRCS})

set(CEFTESTS_HELPER_SHARED_RENDERER_SRCS
  ../shared/renderer/client_app_renderer.cc
  ../shared/renderer/client_app_renderer.h
  )
source_group(shared\\\\renderer FILES ${CEFTESTS_HELPER_SHARED_RENDERER_SRCS})

set(UNITTESTS_HELPER_SRCS
  ${CEFTESTS_HELPER_SRCS}
  ${CEFTESTS_HELPER_SHARED_SRCS}
  ${CEFTESTS_HELPER_SHARED_BROWSER_SRCS}
  ${CEFTESTS_HELPER_SHARED_COMMON_SRCS}
  ${CEFTESTS_HELPER_SHARED_RENDERER_SRCS}
  )

# ceftests resources.
set(CEFTESTS_RESOURCES_MAC_SRCS_MAC
  mac/Info.plist.in
  mac/ceftests.icns
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_RESOURCES_MAC_SRCS)
source_group(ceftests\\\\mac FILES ${CEFTESTS_RESOURCES_MAC_SRCS})

set(CEFTESTS_RESOURCES_MAC_ENGLISH_LPROJ_SRCS_MAC
  mac/English.lproj/InfoPlist.strings
  mac/English.lproj/MainMenu.xib
  )
APPEND_PLATFORM_SOURCES(CEFTESTS_RESOURCES_MAC_ENGLISH_LPROJ_SRCS)
source_group(ceftests\\\\mac\\\\English.lproj FILES ${CEFTESTS_RESOURCES_MAC_ENGLISH_LPROJ_SRCS})

set(CEFTESTS_RESOURCES_SHARED_RESOURCES_SRCS
  ../shared/resources/osr_test.html
  ../shared/resources/pdf.html
  ../shared/resources/pdf.pdf
  ../shared/resources/window_icon.1x.png
  ../shared/resources/window_icon.2x.png
  )
source_group(shared\\\\resources FILES ${CEFTESTS_RESOURCES_SHARED_RESOURCES_SRCS})

set(UNITTESTS_RESOURCES_SRCS
  ${CEFTESTS_RESOURCES_MAC_SRCS}
  ${CEFTESTS_RESOURCES_MAC_ENGLISH_LPROJ_SRCS}
  ${CEFTESTS_RESOURCES_SHARED_RESOURCES_SRCS}
  )

# ceftests data resources.
set(CEFTESTS_DATA_RESOURCES_RESOURCES_NET_DATA_SSL_CERTIFICATES_SRCS
  resources/net/data/ssl/certificates/expired_cert.pem
  resources/net/data/ssl/certificates/localhost_cert.pem
  resources/net/data/ssl/certificates/ok_cert.pem
  resources/net/data/ssl/certificates/root_ca_cert.pem
  )
source_group(ceftests\\\\resources\\\\net\\\\data\\\\ssl\\\\certificates FILES ${CEFTESTS_DATA_RESOURCES_RESOURCES_NET_DATA_SSL_CERTIFICATES_SRCS})

set(UNITTESTS_DATA_RESOURCES_SRCS
  ${CEFTESTS_DATA_RESOURCES_RESOURCES_NET_DATA_SSL_CERTIFICATES_SRCS}
  )

#
# Shared configuration.
#

# Target executable names.
set(CEF_TARGET "ceftests")
if(OS_MAC)
  set(CEF_HELPER_TARGET "ceftests_Helper")
  set(CEF_HELPER_OUTPUT_NAME "ceftests Helper")
else()
  # Logical target used to link the libcef library.
  ADD_LOGICAL_TARGET("libcef_lib" "${CEF_LIB_DEBUG}" "${CEF_LIB_RELEASE}")
endif()

# Determine the target output directory.
SET_CEF_TARGET_OUT_DIR()


#
# Linux configuration.
#

if(OS_LINUX)
  # Find required libraries and update compiler/linker variables.
  FIND_LINUX_LIBRARIES("glib-2.0")

  # Executable target.
  add_executable(${CEF_TARGET} ${UNITTESTS_SRCS} ${UNITTESTS_RESOURCES_SRCS})
  SET_EXECUTABLE_TARGET_PROPERTIES(${CEF_TARGET})
  add_dependencies(${CEF_TARGET} libcef_dll_wrapper cef_gtest)
  target_link_libraries(${CEF_TARGET} libcef_lib libcef_dll_wrapper cef_gtest ${CEF_STANDARD_LIBS})

  # Set rpath so that libraries can be placed next to the executable.
  set_target_properties(${CEF_TARGET} PROPERTIES INSTALL_RPATH "$ORIGIN")
  set_target_properties(${CEF_TARGET} PROPERTIES BUILD_WITH_INSTALL_RPATH TRUE)
  set_target_properties(${CEF_TARGET} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CEF_TARGET_OUT_DIR})

  # Copy binary and resource files to the target output directory.
  COPY_FILES("${CEF_TARGET}" "${CEF_BINARY_FILES}" "${CEF_BINARY_DIR}" "${CEF_TARGET_OUT_DIR}")
  COPY_FILES("${CEF_TARGET}" "${CEF_RESOURCE_FILES}" "${CEF_RESOURCE_DIR}" "${CEF_TARGET_OUT_DIR}")

  # Copy ceftests resource files to the target output directory.
  COPY_FILES("${CEF_TARGET}" "${UNITTESTS_RESOURCES_SRCS}" "${CMAKE_CURRENT_SOURCE_DIR}" "${CEF_TARGET_OUT_DIR}/ceftests_files")

  # Copy ceftests data resource files to the target output directory.
  # Remove these prefixes from input file paths.
  set(PREFIXES
    "resources/"
    )
  COPY_RESOURCES("${CEF_TARGET}" "${UNITTESTS_DATA_RESOURCES_SRCS}" "${PREFIXES}" "${CMAKE_CURRENT_SOURCE_DIR}" "${CEF_TARGET_OUT_DIR}/ceftests_files")

  # Set SUID permissions on the chrome-sandbox target.
  SET_LINUX_SUID_PERMISSIONS("${CEF_TARGET}" "${CEF_TARGET_OUT_DIR}/chrome-sandbox")
endif()


#
# Mac OS X configuration.
#

if(OS_MAC)
  option(OPTION_USE_ARC "Build with ARC (automatic Reference Counting) on macOS." ON)
  if(OPTION_USE_ARC)
    list(APPEND CEF_COMPILER_FLAGS
      -fobjc-arc
      )
    set_target_properties(${target} PROPERTIES
      CLANG_ENABLE_OBJC_ARC "YES"
      )
  endif()

  # Output path for the main app bundle.
  set(CEF_APP "${CEF_TARGET_OUT_DIR}/${CEF_TARGET}.app")

  # Variables referenced from the main Info.plist file.
  set(EXECUTABLE_NAME "${CEF_TARGET}")
  set(PRODUCT_NAME "${CEF_TARGET}")

  if(USE_SANDBOX)
    # Logical target used to link the cef_sandbox library.
    ADD_LOGICAL_TARGET("cef_sandbox_lib" "${CEF_SANDBOX_LIB_DEBUG}" "${CEF_SANDBOX_LIB_RELEASE}")
  endif()

  # Main app bundle target.
  add_executable(${CEF_TARGET} MACOSX_BUNDLE ${UNITTESTS_RESOURCES_SRCS} ${UNITTESTS_SRCS})
  SET_EXECUTABLE_TARGET_PROPERTIES(${CEF_TARGET})
  add_dependencies(${CEF_TARGET} libcef_dll_wrapper cef_gtest)
  target_link_libraries(${CEF_TARGET} libcef_dll_wrapper cef_gtest ${CEF_STANDARD_LIBS})
  set_target_properties(${CEF_TARGET} PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/mac/Info.plist.in
    )

  # Copy the CEF framework into the Frameworks directory.
  add_custom_command(
    TARGET ${CEF_TARGET}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${CEF_BINARY_DIR}/Chromium Embedded Framework.framework"
            "${CEF_APP}/Contents/Frameworks/Chromium Embedded Framework.framework"
    VERBATIM
    )

  # Create the multiple Helper app bundle targets.
  foreach(_suffix_list ${CEF_HELPER_APP_SUFFIXES})
    # Convert to a list and extract the suffix values.
    string(REPLACE ":" ";" _suffix_list ${_suffix_list})
    list(GET _suffix_list 0 _name_suffix)
    list(GET _suffix_list 1 _target_suffix)
    list(GET _suffix_list 2 _plist_suffix)

    # Define Helper target and output names.
    set(_helper_target "${CEF_HELPER_TARGET}${_target_suffix}")
    set(_helper_output_name "${CEF_HELPER_OUTPUT_NAME}${_name_suffix}")

    # Create Helper-specific variants of the helper-Info.plist file. Do this
    # manually because the configure_file command (which is executed as part of
    # MACOSX_BUNDLE_INFO_PLIST) uses global env variables and would insert the
    # wrong values with multiple targets.
    set(_helper_info_plist "${CMAKE_CURRENT_BINARY_DIR}/helper-Info${_target_suffix}.plist")
    file(READ "${CMAKE_CURRENT_SOURCE_DIR}/mac/helper-Info.plist.in" _plist_contents)
    string(REPLACE "\${EXECUTABLE_NAME}" "${_helper_output_name}" _plist_contents ${_plist_contents})
    string(REPLACE "\${PRODUCT_NAME}" "${_helper_output_name}" _plist_contents ${_plist_contents})
    string(REPLACE "\${BUNDLE_ID_SUFFIX}" "${_plist_suffix}" _plist_contents ${_plist_contents})
    file(WRITE ${_helper_info_plist} ${_plist_contents})

    # Create Helper executable target.
    add_executable(${_helper_target} MACOSX_BUNDLE ${UNITTESTS_HELPER_SRCS})
    SET_EXECUTABLE_TARGET_PROPERTIES(${_helper_target})
    add_dependencies(${_helper_target} libcef_dll_wrapper cef_gtest)
    target_link_libraries(${_helper_target} libcef_dll_wrapper cef_gtest ${CEF_STANDARD_LIBS})
    set_target_properties(${_helper_target} PROPERTIES
      MACOSX_BUNDLE_INFO_PLIST ${_helper_info_plist}
      OUTPUT_NAME ${_helper_output_name}
      )

    if(USE_SANDBOX)
      target_link_libraries(${_helper_target} cef_sandbox_lib)
    endif()

    # Add the Helper as a dependency of the main executable target.
    add_dependencies(${CEF_TARGET} "${_helper_target}")

    # Copy the Helper app bundle into the Frameworks directory.
    add_custom_command(
      TARGET ${CEF_TARGET}
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy_directory
              "${CEF_TARGET_OUT_DIR}/${_helper_output_name}.app"
              "${CEF_APP}/Contents/Frameworks/${_helper_output_name}.app"
      VERBATIM
      )
  endforeach()

  # Manually process and copy over resource files.
  # The Xcode generator can support this via the set_target_properties RESOURCE
  # directive but that doesn't properly handle nested resource directories.
  # Remove these prefixes from input file paths.
  set(PREFIXES
    "mac/"
    "resources/"
    "../shared/resources/"
    )
  set(RESOURCES ${UNITTESTS_RESOURCES_SRCS} ${UNITTESTS_DATA_RESOURCES_SRCS})
  COPY_MAC_RESOURCES("${RESOURCES}" "${PREFIXES}" "${CEF_TARGET}" "${CMAKE_CURRENT_SOURCE_DIR}" "${CEF_APP}")
endif()


#
# Windows configuration.
#

if(OS_WINDOWS)
  # Executable target.
  add_executable(${CEF_TARGET} WIN32 ${UNITTESTS_SRCS} ${UNITTESTS_RESOURCES_SRCS})
  add_dependencies(${CEF_TARGET} libcef_dll_wrapper cef_gtest)

  list(APPEND CEF_EXE_LINKER_FLAGS
    /SUBSYSTEM:CONSOLE  # Configure as a console application.
  )

  SET_EXECUTABLE_TARGET_PROPERTIES(${CEF_TARGET})
  target_link_libraries(${CEF_TARGET} libcef_lib libcef_dll_wrapper cef_gtest ${CEF_STANDARD_LIBS})

  if(USE_SANDBOX)
    # Logical target used to link the cef_sandbox library.
    ADD_LOGICAL_TARGET("cef_sandbox_lib" "${CEF_SANDBOX_LIB_DEBUG}" "${CEF_SANDBOX_LIB_RELEASE}")
    target_link_libraries(${CEF_TARGET} cef_sandbox_lib ${CEF_SANDBOX_STANDARD_LIBS})
  endif()

  # Add the custom manifest files to the executable.
  ADD_WINDOWS_MANIFEST("${CMAKE_CURRENT_SOURCE_DIR}/win" "${CEF_TARGET}" "exe")

  # Copy CEF binary and resource files to the target output directory.
  COPY_FILES("${CEF_TARGET}" "${CEF_BINARY_FILES}" "${CEF_BINARY_DIR}" "${CEF_TARGET_OUT_DIR}")
  COPY_FILES("${CEF_TARGET}" "${CEF_RESOURCE_FILES}" "${CEF_RESOURCE_DIR}" "${CEF_TARGET_OUT_DIR}")

  # Copy ceftests data resource files to the target output directory.
  # Remove these prefixes from input file paths.
  set(PREFIXES
    "resources/"
    )
  COPY_RESOURCES("${CEF_TARGET}" "${UNITTESTS_DATA_RESOURCES_SRCS}" "${PREFIXES}" "${CMAKE_CURRENT_SOURCE_DIR}" "${CEF_TARGET_OUT_DIR}/ceftests_files")
endif()
