# access_libs = []
#
#
# access_libs += shared_library('attachment_plugin',
#   'attachment.c',
#   install_dir: plugin_dir,
# )
#
# access_libs += shared_library('dcp_plugin',
#   [
#     'dcp/dcp.cpp',
#     'dcp/dcpdecrypt.cpp',
#     'dcp/dcpparser.cpp',
#   ],
#   install_dir: plugin_dir,
# )
#
# # if HAVE_ASDCP
# #   libdcp_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) $(ASDCP_CFLAGS)
# #   libdcp_plugin_la_LIBADD = $(AM_LIBADD) $(ASDCP_LIBS)
# #   if HAVE_GCRYPT
# #     libdcp_plugin_la_CPPFLAGS += $(GCRYPT_CFLAGS)
# #     libdcp_plugin_la_LIBADD += $(GCRYPT_LIBS)
# #   endif
# # endif
#
# access_libs += shared_library('filesystem_plugin',
#   [
#     'fs.h',
#     'file.c',
#     'directory.c',
#     'fs.c',
#   ],
#   install_dir: plugin_dir,
# )
# #
# # libfilesystem_plugin_la_CPPFLAGS = $(AM_CPPFLAGS)
# # if HAVE_WIN32
# # libfilesystem_plugin_la_LIBADD = -lshlwapi
# # endif
#
# access_libs += shared_library('idummy_plugin',
#   'idummy.c',
#   install_dir: plugin_dir,
# )
#
#
# access_libs += shared_library('imem_plugin',
#   'imem-access.c',
#   dependencies: math,
#   install_dir: plugin_dir,
# )
#
# access_libs += shared_library('access_imem_plugin',
#   'imem.c',
#   install_dir: plugin_dir,
# )
#
# access_libs += shared_library('sdp_plugin', =
#   'sdp.c',
#   install_dir: plugin_dir,
# )
#
# access_libs += shared_library('timecode_plugin'
#   'timecode.c',
#   install_dir: plugin_dir,
# )
#
# access_libs += shared_library('vdr_plugin',
#   'vdr.c',
#   install_dir: plugin_dir,
# )
#
# ################################################################################
# ### Audio capture ###
#
# if true #alsa
#   access_libs += shared_library('access_alsa_plugin',
#     'alsa.c',
#     dependencies: [], #alsa
#     install_dir: plugin_dir,
#   )
# endif
#
# if true #oss
#   access_libs += shared_library('access_oss_plugin',
#     'oss.c',
#     install_dir: plugin_dir,
#   )
#   libaccess_oss_plugin_la_LIBADD = $(OSS_LIBS)
# endif
#
# if true #jack
#   access_libs += shared_library('access_jack_plugin',
#     'jack.c',
#     dependencies: [], #jack
#     install_dir: plugin_dir,
#   )
# endif
#
# if true #pulse
#   access_libs += shared_library('pulsesrc_plugin',
#     'pulse.c',
#     dependencies: [], #pulse
#     install_dir: plugin_dir,
#   )
# endif
#
# access_libs += shared_library('access_qtsound_plugin',
#   'qtsound.m',
#   install_dir: plugin_dir,
# )
# libaccess_qtsound_plugin_la_LDFLAGS = -Wl,-framework,QTKit -Wl,-framework,CoreAudio
#
# EXTRA_LTLIBRARIES += libaccess_qtsound_plugin.la
#
# if false #wasapi and not winstore
#   access_libs += shared_library('access_wasapi_plugin',
#     'wasapi.c',
#     install_dir: plugin_dir,
#   )
#   # libaccess_wasapi_plugin_la_LIBADD = $(LIBCOM) -lksuser
# endif
#
# ################################################################################
# ### Video capture ###
#
# if true #avfoundation
#   access_libs += shared_library('avcapture_plugin',
#     'avcapture.m',
#     install_dir: plugin_dir,
#   )
#   # libavcapture_plugin_la_OBJCFLAGS = $(AM_OBJCFLAGS) -fobjc-arc
#   # libavcapture_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)' -Wl,-framework,Foundation -Wl,-framework,AVFoundation -Wl,-framework,CoreMedia,  -Wl,-framework,CoreVideo
# endif
#
# access_libs += shared_library('dc1394_plugin', =
#   'dc1394.c',
#   install_dir: plugin_dir,
# )
# libdc1394_plugin_la_CFLAGS = $(AM_CFLAGS) $(DC1394_CFLAGS)
# libdc1394_plugin_la_LIBADD = $(DC1394_LIBS)
# libdc1394_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libdc1394_plugin.la
#
# access_libs += shared_library('dv1394_plugin', =
#   'dv.c',
#   install_dir: plugin_dir,
# )
# libdv1394_plugin_la_CFLAGS = $(AM_CFLAGS) $(DV1394_CFLAGS)
# libdv1394_plugin_la_LIBADD = $(DV1394_LIBS) $(LIBPTHREAD)
# libdv1394_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libdv1394_plugin.la
#
# access_libs += shared_library('linsys_hdsdi_plugin', = \
#
#   'linsys/linsys_sdiaudio.h',
#
#   'linsys/linsys_sdivideo.h',
#
#   'linsys/linsys_hdsdi.c',
#   install_dir: plugin_dir,
# )
# liblinsys_hdsdi_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
# liblinsys_hdsdi_plugin_la_LIBADD = $(LIBPTHREAD)
# access_libs += shared_library('linsys_sdi_plugin', =
#   'linsys/linsys_sdi.c',
#   'linsys/linsys_sdi.h',
#   install_dir: plugin_dir,
# )
# liblinsys_sdi_plugin_la_CFLAGS = $(AM_CFLAGS) $(LINSYS_SDI_CFLAGS)
# liblinsys_sdi_plugin_la_LIBADD = $(LINSYS_SDI_LIBS)
# liblinsys_sdi_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += liblinsys_hdsdi_plugin.la liblinsys_sdi_plugin.la
#
# access_libs += shared_library('decklink_plugin', =
#   'decklink.cpp',
#   'sdi.c',
#   'sdi.h',
#   install_dir: plugin_dir,
# )
# libdecklink_plugin_la_CXXFLAGS = $(AM_CXXFLAGS) $(CPPFLAGS_decklink)
# libdecklink_plugin_la_LIBADD = $(LIBS_decklink) $(LIBDL) -lpthread
# if HAVE_DECKLINK
#
# endif
#
# access_libs += shared_library('shm_plugin', =
#   'shm.c',
#   install_dir: plugin_dir,
# )
# libshm_plugin_la_LIBADD = $(LIBM)
#
#
# access_libs += shared_library('v4l2_plugin', = \
#
#   'v4l2/linux/videodev2.h',
#
#   'v4l2/linux/v4l2-common.h',
#
#   'v4l2/linux/v4l2-controls.h',
#
#   'v4l2/v4l2.c',
#
#   'v4l2/video.c',
#
#   'v4l2/vbi.c',
#
#   'v4l2/demux.c',
#
#   'v4l2/access.c',
#
#   'v4l2/radio.c',
#
#   'v4l2/controls.c',
#
#   'v4l2/lib.c',
#
#   'v4l2/v4l2.h',
#   install_dir: plugin_dir,
# )
# libv4l2_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/
#   'v4l2',
# libv4l2_plugin_la_CFLAGS = $(AM_CFLAGS) $(ZVBI_CFLAGS)
# libv4l2_plugin_la_LIBADD = $(LIBDL) $(LIBM) $(ZVBI_LIBS) $(LIBPTHREAD)
# if HAVE_V4L2
#
# endif
#
# access_libs += shared_library('dshow_plugin', =
#   'dshow/vlc_dshow.h',
#   'dshow/dshow.cpp',
#   'dshow/access.h',
#
#   'dshow/filter.cpp',
#   'dshow/filter.h',
#   'dshow/crossbar.cpp',
#   install_dir: plugin_dir,
# )
# libdshow_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DSTRSAFE_NO_DEPRECATE
# libdshow_plugin_la_LIBADD = $(LIBCOM) -loleaut32 -luuid -lstrmiids -lksuser
# if HAVE_WIN32_DESKTOP
#
# endif
#
#
# ### Screen grab ###
#
# access_libs += shared_library('xcb_screen_plugin', =
#   'screen/xcb.c',
# libxcb_screen_plugin_la_CFLAGS = $(AM_CFLAGS) \
# 	$(XCB_CFLAGS) $(XCB_COMPOSITE_CFLAGS) $(XCB_SHM_CFLAGS)
# libxcb_screen_plugin_la_LIBADD = $(XCB_LIBS) $(XCB_COMPOSITE_LIBS) $(XCB_SHM_LIBS)
# if HAVE_XCB
#
# endif
#
# access_libs += shared_library('wl_screenshooter_plugin', = \
#
#   'screen/wayland.c',
#   install_dir: plugin_dir,
# )
# access_libs += shared_library('ist_libwl_screenshooter_plugin', = \
#
#   'screen/screenshooter-protocol.c',
#   install_dir: plugin_dir,
# )
# libwl_screenshooter_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -I
#   'screen',
# libwl_screenshooter_plugin_la_CFLAGS = $(WAYLAND_CLIENT_CFLAGS)
# libwl_screenshooter_plugin_la_LIBADD = $(WAYLAND_CLIENT_LIBS) \
# 	$(LIBPTHREAD) $(LIBM)
# EXTRA_DIST +=
#   'screen/screenshooter.xml',
# access_libs += shared_library('ANFILES', += $(nodist_libwl_screenshooter_plugin)
# if HAVE_WAYLAND
# BUILT_SOURCES +=
#   'screen/screenshooter-client-protocol.h',
#
# endif
#
# access_libs += shared_library('screen_plugin', =
#   'screen/screen.c',
#   'screen/screen.h',
#   install_dir: plugin_dir,
# )
# libscreen_plugin_la_LDFLAGS = $(AM_LDFLAGS)
# if HAVE_WIN32_DESKTOP
# access_libs += shared_library('screen_plugin', +=
#   'screen/win32.c',
#   install_dir: plugin_dir,
# )
# libscreen_plugin_la_LIBADD = -lgdi32
#
# endif
# if HAVE_MAC_SCREEN
# access_libs += shared_library('screen_plugin', +=
#   'screen/mac.c',
#   install_dir: plugin_dir,
# )
# libscreen_plugin_la_LDFLAGS += "-Wl,-framework,OpenGL,-framework,ApplicationServices"
#
# endif
#
# access_libs += shared_library('rdp_plugin', =
#   'rdp.c',
#   install_dir: plugin_dir,
# )
# librdp_plugin_la_CFLAGS = $(AM_CFLAGS) $(FREERDP_CFLAGS)
# librdp_plugin_la_LIBADD = $(FREERDP_LIBS)
# librdp_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += librdp_plugin.la
#
# access_libs += shared_library('vnc_plugin', =
#   'vnc.c',
# libvnc_plugin_la_CFLAGS = $(AM_CFLAGS) $(VNC_CFLAGS)
# libvnc_plugin_la_LIBADD = $(VNC_LIBS)
# libvnc_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libvnc_plugin.la
#
#
# ### Optical media ###
#
# access_libs += shared_library('cdda_plugin', =
#   'cdda.c',
#   'vcd/cdrom.c',
#   'vcd/cdrom.h',
#   'vcd/cdrom_internals.h',
# libcdda_plugin_la_CFLAGS = $(AM_CFLAGS) $(LIBCDDB_CFLAGS)
# libcdda_plugin_la_LIBADD = $(LIBCDDB_LIBS) $(LIBM)
# libcdda_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
# if HAVE_DARWIN
# libcdda_plugin_la_LIBADD += -liconv
# libcdda_plugin_la_LDFLAGS += -Wl,-framework,IOKit,-framework,CoreFoundation
# endif
# EXTRA_LTLIBRARIES += libcdda_plugin.la
#
#
# access_libs += shared_library('vcd_plugin', =
#   'vcd/vcd.c',
#   'vcd/cdrom.c',
#   'vcd/cdrom.h',
#   'vcd/cdrom_internals.h',
# libvcd_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
# if HAVE_DARWIN
# libvcd_plugin_la_LIBADD = -liconv
# libvcd_plugin_la_LDFLAGS += -Wl,-framework,IOKit,-framework,CoreFoundation
# endif
# EXTRA_LTLIBRARIES += libvcd_plugin.la
#
#
# access_libs += shared_library('dvdnav_plugin', =
#   'dvdnav.c demux/mpeg/ps.h demux/mpeg/pes.h',
# libdvdnav_plugin_la_CFLAGS = $(AM_CFLAGS) $(DVDNAV_CFLAGS)
# libdvdnav_plugin_la_LIBADD = $(DVDNAV_LIBS)
# libdvdnav_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
# if HAVE_DARWIN
# libdvdnav_plugin_la_LDFLAGS += -Wl,-framework,IOKit,-framework,CoreFoundation
# endif
#
# EXTRA_LTLIBRARIES += libdvdnav_plugin.la
#
# access_libs += shared_library('dvdread_plugin', =
#   'dvdread.c demux/mpeg/ps.h demux/mpeg/pes.h',
# libdvdread_plugin_la_CFLAGS = $(AM_CFLAGS) $(DVDREAD_CFLAGS)
# libdvdread_plugin_la_LIBADD = $(DVDREAD_LIBS)
# libdvdread_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
# if HAVE_DARWIN
# libdvdread_plugin_la_LDFLAGS += -Wl,-framework,IOKit,-framework,CoreFoundation
# endif
#
# EXTRA_LTLIBRARIES += libdvdread_plugin.la
#
# access_libs += shared_library('libbluray_plugin', =
#   'bluray.c',
# liblibbluray_plugin_la_CFLAGS = $(AM_CFLAGS) $(BLURAY_CFLAGS)
# liblibbluray_plugin_la_LIBADD = $(BLURAY_LIBS)
# liblibbluray_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += liblibbluray_plugin.la
#
# ### Digital TV ###
#
# access_libs += shared_library('dtv_plugin', = \
#
#   'dtv/dtv.h',
#
#   'dtv/access.c',
# libdtv_plugin_la_CFLAGS = $(AM_CFLAGS)
#
# if HAVE_LINUX_DVB
# access_libs += shared_library('dtv_plugin', +=
#   'dtv/linux.c',
#
#   'dtv/en50221.c',
#
#   'dtv/en50221.h',
#
#   'dtv/en50221_capmt.h',
# libdtv_plugin_la_CFLAGS += -DHAVE_LINUX_DVB
#
# endif
#
# if HAVE_WIN32_DESKTOP
# # Work-around automake bug:
# # Use an import library for C++ to retain C linker on other platforms.
# access_libs += shared_library('bda', =
#   'dtv/bdadefs.h',
#   'dtv/bdagraph.cpp',
#   'dtv/bdagraph.hpp',
# libbda_la_LDFLAGS = -static
# libbda_la_LIBADD = -lstrmiids $(LIBCOM) -loleaut32 -luuid
# noinst_LTLIBRARIES += libbda.la
#
# libdtv_plugin_la_DEPENDENCIES = libbda.la
# libdtv_plugin_la_LIBADD = libbda.la -lstdc++
#
# endif
#
# # Old Linux DVB scanner
# access_libs += shared_library('dvb_plugin', = \
#
#   'dvb/access.c',
#
#   'dvb/linux_dvb.c',
#
#   'dvb/scan.c',
#   'dvb/scan.h',
#
#   'dvb/scan_list.c',
#   'dvb/scan_list.h',
#
#   'dvb/dvb.h',
# libdvb_plugin_la_CFLAGS = $(AM_CFLAGS)
# if HAVE_LINUX_DVB
# if HAVE_DVBPSI
# access_libs += shared_library('dvb_plugin', += mux/mpeg/dvbpsi_compat.h
#
# libdvb_plugin_la_CFLAGS += $(DVBPSI_CFLAGS)
# libdvb_plugin_la_LIBADD = $(DVBPSI_LIBS)
# endif
# endif
#
# ### Network streams ###
#
# access_libs += shared_library('ftp_plugin', =
#   'ftp.c',
# libftp_plugin_la_LIBADD = $(SOCKET_LIBS)
#
#
# access_libs += shared_library('http_plugin', =
#   'http.c',
# libhttp_plugin_la_LIBADD = $(SOCKET_LIBS)
#
#
# access_libs += shared_library('live555_plugin', =
#   'live555.cpp',
#   'mms/asf.c',
#   'mms/buffer.c',
# liblive555_plugin_la_CXXFLAGS = $(AM_CXXFLAGS) $(CXXFLAGS_live555)
# liblive555_plugin_la_LIBADD = $(LIBS_live555) $(SOCKET_LIBS)
# liblive555_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)' \
# 	$(LDFLAGS_live555)
#
# EXTRA_LTLIBRARIES += liblive555_plugin.la
#
# access_libs += shared_library('access_mms_plugin', = \
#
#   'mms/mms.c',
#   'mms/mms.h',
#
#   'mms/mmsh.c',
#   'mms/mmsh.h',
#
#   'mms/mmstu.c',
#   'mms/mmstu.h',
#
#   'mms/buffer.c',
#   'mms/buffer.h',
#
#   'mms/asf.h',
#   'mms/asf.c',
# 	demux/asf/libasf_guid.h
# libaccess_mms_plugin_la_CFLAGS = $(AM_CFLAGS)
# libaccess_mms_plugin_la_LIBADD = $(SOCKET_LIBS)
#
#
# access_libs += shared_library('smbc_plugin', =
#   'samba.c',
#   'smb_common.h',
# libsmbc_plugin_la_CFLAGS = $(AM_CFLAGS) $(SMBCLIENT_CFLAGS)
# libsmbc_plugin_la_LIBADD = $(SMBCLIENT_LIBS)
# libsmbc_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libsmbc_plugin.la
#
# access_libs += shared_library('dsm_plugin', =
#   'dsm/access.c',
#   'dsm/sd.c',
#   'smb_common.h',
# libdsm_plugin_la_CFLAGS = $(AM_CFLAGS) $(DSM_CFLAGS)
# libdsm_plugin_la_LIBADD = $(DSM_LIBS)
# libdsm_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libdsm_plugin.la
#
# access_libs += shared_library('tcp_plugin', =
#   'tcp.c',
# libtcp_plugin_la_LIBADD = $(SOCKET_LIBS)
#
#
# access_libs += shared_library('udp_plugin', =
#   'udp.c',
# libudp_plugin_la_LIBADD = $(SOCKET_LIBS) $(LIBPTHREAD)
#
#
# access_libs += shared_library('unc_plugin', =
#   'unc.c',
#   'smb_common.h',
# libunc_plugin_la_LIBADD = -lmpr -lnetapi32
# if HAVE_WIN32
# if !HAVE_WINSTORE
#
# endif
# endif
#
# access_libs += shared_library('sftp_plugin', =
#   'sftp.c',
# libsftp_plugin_la_CFLAGS = $(AM_CFLAGS) $(SFTP_CFLAGS)
# libsftp_plugin_la_LIBADD = $(SFTP_LIBS)
# libsftp_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libsftp_plugin.la
#
# access_libs += shared_library('nfs_plugin', =
#   'nfs.c',
# libnfs_plugin_la_CFLAGS = $(AM_CFLAGS) $(NFS_CFLAGS)
# libnfs_plugin_la_LIBADD = $(NFS_LIBS) $(SOCKET_LIBS)
# libnfs_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libnfs_plugin.la
#
# access_libs += shared_library('access_realrtsp_plugin', = \
#
#   'rtsp/access.c',
#
#   'rtsp/rtsp.c',
#   'rtsp/rtsp.h',
#
#   'rtsp/real.c',
#   'rtsp/real.h',
#
#   'rtsp/real_rmff.c',
#   'rtsp/real_rmff.h',
#
#   'rtsp/real_sdpplin.c',
#   'rtsp/real_sdpplin.h',
#
#   'rtsp/real_asmrp.c',
# libaccess_realrtsp_plugin_la_CPPFLAGS = $(AM_CPPFLAGS)
# libaccess_realrtsp_plugin_la_LIBADD = $(SOCKET_LIBS)
# libaccess_realrtsp_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libaccess_realrtsp_plugin.la
#
# access_libs += shared_library('avio_plugin', =
#   'avio.c',
#   'avio.h',
# libavio_plugin_la_CFLAGS = $(AM_CFLAGS) $(AVFORMAT_CFLAGS) $(AVUTIL_CFLAGS)
# libavio_plugin_la_LDFLAGS = $(AM_LDFLAGS) $(SYMBOLIC_LDFLAGS)
# libavio_plugin_la_LIBADD = $(AVFORMAT_LIBS) $(AVUTIL_LIBS) $(LIBM)
# if HAVE_AVFORMAT
# if !MERGE_FFMPEG
#
# endif
# endif
#
# access_libs += shared_library('satip_plugin', =
#   'satip.c',
# libsatip_plugin_la_LIBADD = $(SOCKET_LIBS) $(LIBPTHREAD)
#
#
# ### Misc ###
#
# access_libs += shared_library('access_concat_plugin', =
#   'concat.c',
#
#
# access_libs += shared_library('access_mtp_plugin', =
#   'mtp.c',
# libaccess_mtp_plugin_la_CFLAGS = $(AM_CFLAGS) $(MTP_CFLAGS)
# libaccess_mtp_plugin_la_LIBADD = $(MTP_LIBS)
# libaccess_mtp_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libaccess_mtp_plugin.la
#
# ### SRT ###
#
# access_libs += shared_library('access_srt_plugin', =
#   'srt.c',
#   dependencies: [], #srt
#   install_dir: plugin_dir,
# )
# libaccess_srt_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) $(SRT_CPPFLAGS)
# libaccess_srt_plugin_la_LIBADD = $(SRT_LIBS)
# libaccess_srt_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(accessdir)'
#
# EXTRA_LTLIBRARIES += libaccess_srt_plugin.la
