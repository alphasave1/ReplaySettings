from gui.Scaleform.framework import g_entitiesFactories, ViewSettings
from gui.Scaleform.framework import ViewTypes, ScopeTemplates
from gui.Scaleform.framework.entities.abstract.AbstractViewMeta import AbstractViewMeta
from gui.app_loader import g_appLoader
from gui.Scaleform.framework.entities.View import View
from helpers import html
from gui.Scaleform.framework.managers.loaders import SFViewLoadParams
from gui.shared.utils.key_mapping import getBigworldNameFromKey
from PlayerEvents import g_playerEvents
import BattleReplay
import BigWorld
import ResMgr
import constants
from gui.modsListApi import g_modsListApi

savedValue = 0
xmlRead = ResMgr.openSection('../mods/configs/ReplaySettings/mod_replayset.xml')

def init():
    g_modsListApi.addModification(id='ReplaySettings', name='Replay Settings', description='Set save replay on any battle type.', enabled=True, callback=lambda : g_appLoader.getDefLobbyApp().loadView(SFViewLoadParams(_alias, None)), login=True, lobby=True, icon='gui/flash/replaysettings.jpg')
    g_playerEvents.onAvatarBecomePlayer += subscribe
    g_playerEvents.onAvatarBecomeNonPlayer += unsubscribe
    global savedValue
    global xmlRead
    savedValue = BattleReplay.g_replayCtrl.isAutoRecordingEnabled

class TestWindow(View,AbstractViewMeta):

    def __init__(self):
        View.__init__(self)

    def _populate(self):
        View._populate(self)
        self.init()
        self.as_setdata()

    def as_setdata(self): #XML Value -> AS3 Value
        global xmlRead
        UNKNOWN = xmlRead.readBool(CFG[0])
        RANDOM = xmlRead.readBool(CFG[1])
        TRAINING = xmlRead.readBool(CFG[2])
        CYBERSPORT = xmlRead.readBool(CFG[3])
        FALLOUT = xmlRead.readBool(CFG[4])
        EVENT_BATTLES = xmlRead.readBool(CFG[5])
        FALLOUT_CLASSIC = xmlRead.readBool(CFG[6])
        FALLOUT_MULTITEAM = xmlRead.readBool(CFG[7])
        SORTIE_2 = xmlRead.readBool(CFG[8])
        FORT_BATTLE_2 = xmlRead.readBool(CFG[9])
        RANKED = xmlRead.readBool(CFG[10])
        EPIC_RANDOM = xmlRead.readBool(CFG[11])
        EPIC_RANDOM_TRAINING = xmlRead.readBool(CFG[12])
        EPIC_BATTLE = xmlRead.readBool(CFG[13])
        EPIC_TRAINING = xmlRead.readBool(CFG[14])
        return self.flashObject.as_senddata(UNKNOWN,RANDOM,TRAINING,CYBERSPORT,FALLOUT,EVENT_BATTLES,FALLOUT_CLASSIC,FALLOUT_MULTITEAM,SORTIE_2,FORT_BATTLE_2,RANKED,EPIC_RANDOM,EPIC_RANDOM_TRAINING,EPIC_BATTLE,EPIC_TRAINING)

    def init(self):
        self.flashObject.setup()
        
    def _dispose(self):
        pass
        #AS3 Value -> XML Value
    def as_data_changed(self, UNKNOWN,RANDOM,TRAINING,CYBERSPORT,FALLOUT,EVENT_BATTLES,FALLOUT_CLASSIC,FALLOUT_MULTITEAM,SORTIE_2,FORT_BATTLE_2,RANKED,EPIC_RANDOM,EPIC_RANDOM_TRAINING,EPIC_BATTLE,EPIC_TRAINING):
        global xmlRead
        for gui in CFG:
            if xmlRead.has_key(gui):
                xmlRead.writeBool('UNKNOWN',bool(UNKNOWN))                          #0
                xmlRead.writeBool('RANDOM',bool(RANDOM))                            #1
                xmlRead.writeBool('TRAINING',bool(TRAINING))                        #2
                xmlRead.writeBool('CYBERSPORT',bool(CYBERSPORT))                    #3
                xmlRead.writeBool('FALLOUT',bool(FALLOUT))                          #4
                xmlRead.writeBool('EVENT_BATTLES',bool(EVENT_BATTLES))              #5
                xmlRead.writeBool('FALLOUT_CLASSIC',bool(FALLOUT_CLASSIC))          #6
                xmlRead.writeBool('FALLOUT_MULTITEAM',bool(FALLOUT_MULTITEAM))      #7
                xmlRead.writeBool('SORTIE_2',bool(SORTIE_2))                        #8
                xmlRead.writeBool('FORT_BATTLE_2',bool(FORT_BATTLE_2))              #9
                xmlRead.writeBool('RANKED',bool(RANKED))                            #10
                xmlRead.writeBool('EPIC_RANDOM',bool(EPIC_RANDOM))                  #11
                xmlRead.writeBool('EPIC_RANDOM_TRAINING',bool(EPIC_RANDOM_TRAINING))#12
                xmlRead.writeBool('EPIC_BATTLE',bool(EPIC_BATTLE))                  #13
                xmlRead.writeBool('EPIC_TRAINING',bool(EPIC_TRAINING))              #14
        
    def as_okClicked(self):
        global xmlRead
        xmlRead.save();
        
    def as_cancelClicked(self):
        pass
    
    def htmltranslate(self, text):
        return html.translation(text)

    def onWindowClose(self):
        #self.flashObject.as_setText()
        self.destroy()
        
    def onTryClosing(self):
        return True


_alias = 'SettingWindow'
_url = 'ReplaySettings.swf'
_type = ViewTypes.WINDOW
_event = None
_scope = ScopeTemplates.WINDOW_VIEWED_MULTISCOPE


_settings = ViewSettings(_alias, TestWindow, _url, _type, _event, _scope)
g_entitiesFactories.addSettings(_settings)

CFG=['UNKNOWN','RANDOM','TRAINING','CYBERSPORT','FALLOUT',
'EVENT_BATTLES','FALLOUT_CLASSIC','FALLOUT_MULTITEAM',
'SORTIE_2','FORT_BATTLE_2','RANKED','EPIC_RANDOM',
'EPIC_RANDOM_TRAINING','EPIC_BATTLE','EPIC_TRAINING']

def subscribe():
    global savedValue
    global xmlRead
    if BattleReplay.isPlaying():
        None
    else:
        for gui in CFG:
            if xmlRead.has_key(gui):
                b_value = xmlRead.readBool(gui)
                if b_value == False:
                    gotValue = getattr(constants.ARENA_GUI_TYPE,gui)
                    if(savedValue == 1 or savedValue == 2):
                        if(BigWorld.player().arena.guiType == gotValue):
                            BattleReplay.g_replayCtrl.enableAutoRecordingBattles(0)
                            print BigWorld.player().arena.guiType
                            print BattleReplay.g_replayCtrl.isAutoRecordingEnabled
                            print BattleReplay.g_replayCtrl.isRecording

def unsubscribe():
    global savedValue
    BattleReplay.g_replayCtrl.enableAutoRecordingBattles(savedValue)
