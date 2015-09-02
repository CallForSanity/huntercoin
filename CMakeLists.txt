CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(owngamecoin)

# set cmake module path
SET(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj")

FIND_PACKAGE(Boost COMPONENTS system filesystem thread chrono program_options REQUIRED)
FIND_PACKAGE(OpenSSL REQUIRED)
FIND_PACKAGE(BerkeleyDB REQUIRED)
FIND_PACKAGE(QREncode REQUIRED)
FIND_PACKAGE(Qt4 COMPONENTS QtCore QtGui QtNetwork REQUIRED)
INCLUDE(${QT_USE_FILE})

INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS} ${OPENSSL_INCLUDE_DIR} ${BERKELYDB_INCLUDE_DIR} ${QRENCODE_INCLUDE_DIR}
	${CMAKE_CURRENT_BINARY_DIR} "${CMAKE_CURRENT_BINARY_DIR}/src/qt")
ADD_DEFINITIONS(-DBOOST_ALL_NO_LIB)
ADD_DEFINITIONS(-D__WXMSW__ -DGUI)

SET(mocin_inc
    src/qt/managenamespage.cpp
    src/qt/overviewpage.cpp
    src/qt/rpcconsole.cpp
)
QT4_GENERATE_MOC("src/qt/managenamespage.cpp" "${CMAKE_CURRENT_BINARY_DIR}/src/qt/managenamespage.moc")
QT4_GENERATE_MOC("src/qt/overviewpage.cpp" "${CMAKE_CURRENT_BINARY_DIR}/src/qt/overviewpage.moc")
QT4_GENERATE_MOC("src/qt/rpcconsole.cpp" "${CMAKE_CURRENT_BINARY_DIR}/src/qt/rpcconsole.moc")
SET(mocout_inc
    "${CMAKE_CURRENT_BINARY_DIR}/src/qt/managenamespage.moc"
    "${CMAKE_CURRENT_BINARY_DIR}/src/qt/overviewpage.moc"
    "${CMAKE_CURRENT_BINARY_DIR}/src/qt/rpcconsole.moc"
)

SET(mocin
	#src/qt/netbase.h
    src/qt/bitcoingui.h
    src/qt/transactiontablemodel.h
    src/qt/addresstablemodel.h
    src/qt/optionsdialog.h
    src/qt/sendcoinsdialog.h
    src/qt/managenamespage.h
    src/qt/configurenamedialog1.h
    src/qt/configurenamedialog2.h
    src/qt/nametablemodel.h
    src/qt/addressbookpage.h
    src/qt/signverifymessagedialog.h
    src/qt/aboutdialog.h
    src/qt/editaddressdialog.h
    src/qt/bitcoinaddressvalidator.h
    src/qt/clientmodel.h
    src/qt/guiutil.h
    src/qt/transactionrecord.h
    src/qt/guiconstants.h
    src/qt/optionsmodel.h
    src/qt/monitoreddatamapper.h
    src/qt/transactiondesc.h
    src/qt/transactiondescdialog.h
    src/qt/bitcoinamountfield.h
    src/qt/transactionfilterproxy.h
    src/qt/transactionview.h
    src/qt/walletmodel.h
    src/qt/overviewpage.h
    src/qt/csvmodelwriter.h
    src/qt/sendcoinsentry.h
    src/qt/qvalidatedlineedit.h
    src/qt/bitcoinunits.h
    src/qt/qvaluecombobox.h
    src/qt/askpassphrasedialog.h
    src/qt/notificator.h
    src/qt/paymentserver.h
    src/qt/ui_interface.h
    src/qt/gamemapview.h
    src/qt/gamechatview.h
    src/qt/rpcconsole.h
	src/qt/qrcodedialog.h
	src/qt/gamechatview.h
	src/qt/nametablemodel.h
	
	#src/qt/netbase.cpp
    src/qt/bitcoin.cpp
    #src/qt/bitcoingui.cpp
    #src/qt/transactiontablemodel.cpp
    #src/qt/addresstablemodel.cpp
    #src/qt/optionsdialog.cpp
    #src/qt/sendcoinsdialog.cpp
    #src/qt/managenamespage.cpp
    #src/qt/configurenamedialog1.cpp
    #src/qt/configurenamedialog2.cpp
    #src/qt/nametablemodel.cpp
    #src/qt/addressbookpage.cpp
    #src/qt/signverifymessagedialog.cpp
    #src/qt/aboutdialog.cpp
    #src/qt/editaddressdialog.cpp
    #src/qt/bitcoinaddressvalidator.cpp
    #src/qt/clientmodel.cpp
    #src/qt/guiutil.cpp
    #src/qt/transactionrecord.cpp
    #src/qt/optionsmodel.cpp
    #src/qt/monitoreddatamapper.cpp
    #src/qt/transactiondesc.cpp
    #src/qt/transactiondescdialog.cpp
    src/qt/bitcoinstrings.cpp
    #src/qt/bitcoinamountfield.cpp
    #src/qt/transactionfilterproxy.cpp
    #src/qt/transactionview.cpp
    #src/qt/walletmodel.cpp
    #src/qt/overviewpage.cpp
    #src/qt/csvmodelwriter.cpp
    #src/qt/sendcoinsentry.cpp
    #src/qt/qvalidatedlineedit.cpp
    #src/qt/bitcoinunits.cpp
    #src/qt/qvaluecombobox.cpp
    #src/qt/askpassphrasedialog.cpp
    #src/qt/notificator.cpp
    #src/qt/paymentserver.cpp
    #src/qt/gamemapview.cpp
    #src/qt/gamechatview.cpp
    #src/qt/rpcconsole.cpp
	#src/qt/qrcodedialog.cpp
)

#FILE(GLOB mocin "src/qt/*.cpp" "src/qt/*.h")
QT4_WRAP_CPP(mocout ${mocin})

FILE(GLOB uiin "src/qt/forms/*.ui")
QT4_WRAP_UI(uiout ${uiin})

QT4_ADD_RESOURCES(rcout "src/qt/bitcoin.qrc" "src/qt/gamemap.qrc")
FILE(GLOB_RECURSE src "src/*.cpp" "src/*.h")
ADD_EXECUTABLE(owngamecoin ${src} ${mocout} ${uiout} ${rcout} ${mocout_inc} "${CMAKE_CURRENT_SOURCE_DIR}/src/qt/res/bitcoin-qt.rc")
TARGET_LINK_LIBRARIES(owngamecoin Shlwapi.lib ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${BERKELYDB_LIBRARIES} ${QRENCODE_LIBRARY} ${QT_LIBRARIES})