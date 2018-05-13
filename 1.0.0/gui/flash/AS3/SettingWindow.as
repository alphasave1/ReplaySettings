package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import net.wg.gui.components.controls.InfoIcon;
   import net.wg.dev.lobby.messengerBar.carousel.ChannelCarouselScrollBar;
   import net.wg.gui.components.controls.CheckBox;
   import net.wg.gui.components.controls.SoundButton;
   import net.wg.infrastructure.base.AbstractWindowView;
   import scaleform.clik.core.UIComponent;
	
	/**
	 * ...
	 * @author alphasave1
	 */
	public class SettingWindow extends AbstractWindowView 
	{
	  public var soundButtonOk:SoundButton;
      
      public var soundButtonCancel:SoundButton;
	  
	  public var timer:Timer;
	  
	  public var py_log:Function;
      
      public var savetext:TextField;
      
	  private var TipsText:TextField;
	  
      public var as_data_changed:Function = null;
	  
	  public var htmltranslate:Function = null;
      
      public var as_okClicked:Function = null;
      
      public var as_cancelClicked:Function = null;
      
      public var UNKNOWN_checkbox:CheckBox;
      
      public var RANDOM_checkbox:CheckBox;
      
      public var TRAINING_checkbox:CheckBox;
      
      public var CYBERSPORT_checkbox:CheckBox;
      
      public var FALLOUT_checkbox:CheckBox;
	  
	  public var EVENT_BATTLES_checkbox:CheckBox;
	  
	  public var FALLOUT_CLASSIC_checkbox:CheckBox;
	  
	  public var FALLOUT_MULTITEAM_checkbox:CheckBox;
	  
	  public var SORTIE_2_checkbox:CheckBox;
	  
	  public var FORT_BATTLE_2_checkbox:CheckBox;
	  
	  public var RANKED_checkbox:CheckBox;
	  
	  public var EPIC_RANDOM_checkbox:CheckBox;
	  
	  public var EPIC_RANDOM_TRAINING_checkbox:CheckBox;
	  
	  public var EPIC_BATTLE_checkbox:CheckBox;
	  
	  public var EPIC_TRAINING_checkbox:CheckBox;
      
      public var UNKNOWN:Boolean = true;
      
      public var RANDOM:Boolean = true;
      
      public var TRAINING:Boolean = true;
      
      public var CYBERSPORT:Boolean = true;
      
      public var FALLOUT:Boolean = true;
	  
	  public var EVENT_BATTLES:Boolean = true;
	  
	  public var FALLOUT_CLASSIC:Boolean = true;
	  
	  public var FALLOUT_MULTITEAM:Boolean = true;
	  
	  public var SORTIE_2:Boolean = true;
	  
	  public var FORT_BATTLE_2:Boolean = true;
	  
	  public var RANKED:Boolean = true;
	  
	  public var EPIC_RANDOM:Boolean = true;
	  
	  public var EPIC_RANDOM_TRAINING:Boolean = true;
	  
	  public var EPIC_BATTLE:Boolean = true;
	  
	  public var EPIC_TRAINING:Boolean = true;
	  
	  public var tooltipText:String = "This battle type is EPIC.(EPIC_RANDOM_TRAINING)";
	  
	  public var tooltipText2:String = "This battle type is EPIC.(EPIC_TRAINING)";
	  
	  public var array:Array = [UNKNOWN, RANDOM, TRAINING, CYBERSPORT, FALLOUT, EVENT_BATTLES,
	  FALLOUT_CLASSIC, FALLOUT_MULTITEAM, SORTIE_2, FORT_BATTLE_2, RANKED, EPIC_RANDOM, EPIC_RANDOM_TRAINING,
	  EPIC_BATTLE, EPIC_TRAINING];
		
		public function SettingWindow() 
		{
			super();
		}
		override protected function configUI():void 
		{
			super.configUI();
		}
		override protected function onPopulate():void 
		{
			super.onPopulate();
			this.width = 350;
			this.height = 450;
			this.window.title = "Replay Save Settings";
		}
		override protected function onDispose():void 
		{
			super.onDispose();
		}
		//CheckBox Data
		public function setup():void 
		{
			this.UNKNOWN_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":35,
			"selected":this.UNKNOWN,
			"label":"#menu:loading/battleTypes/0"
			})) as CheckBox;
			this.UNKNOWN_checkbox.addEventListener(MouseEvent.CLICK,this.UNKNOWN_changed);
			this.RANDOM_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":60,
			"selected":this.RANDOM,
			"label":"#menu:loading/battleTypes/1"
			})) as CheckBox;
			this.RANDOM_checkbox.addEventListener(MouseEvent.CLICK,this.RANDOM_changed);
			this.TRAINING_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":85,
			"selected":this.TRAINING,
			"label":"#menu:loading/battleTypes/2"
			})) as CheckBox;
			this.TRAINING_checkbox.addEventListener(MouseEvent.CLICK,this.TRAINING_changed);
			this.CYBERSPORT_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":110,
			"selected":this.CYBERSPORT,
			"label":"#menu:loading/battleTypes/5"
			})) as CheckBox;
			this.CYBERSPORT_checkbox.addEventListener(MouseEvent.CLICK,this.CYBERSPORT_changed);
			this.FALLOUT_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":135,
			"selected":this.FALLOUT,
			"label":"#menu:loading/battleTypes/6"
			})) as CheckBox;
			this.FALLOUT_checkbox.addEventListener(MouseEvent.CLICK,this.FALLOUT_changed);
			this.EVENT_BATTLES_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":160,
			"selected":this.EVENT_BATTLES,
			"label":"#menu:loading/battleTypes/7"
			})) as CheckBox;
			this.EVENT_BATTLES_checkbox.addEventListener(MouseEvent.CLICK,this.EVENT_BATTLES_changed);
			this.FALLOUT_CLASSIC_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":185,
			"selected":this.FALLOUT_CLASSIC,
			"label":"#menu:loading/battleTypes/13"
			})) as CheckBox;
			this.FALLOUT_CLASSIC_checkbox.addEventListener(MouseEvent.CLICK,this.FALLOUT_CLASSIC_changed);
			this.FALLOUT_MULTITEAM_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":210,
			"selected":this.FALLOUT_MULTITEAM,
			"label":"#menu:loading/battleTypes/14"
			})) as CheckBox;
			this.FALLOUT_MULTITEAM_checkbox.addEventListener(MouseEvent.CLICK,this.FALLOUT_MULTITEAM_changed);
			this.SORTIE_2_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":235,
			"selected":this.SORTIE_2,
			"label":"#menu:loading/battleTypes/15"
			})) as CheckBox;
			this.SORTIE_2_checkbox.addEventListener(MouseEvent.CLICK,this.SORTIE_2_changed);
			this.FORT_BATTLE_2_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":260,
			"selected":this.FORT_BATTLE_2,
			"label":"#menu:loading/battleTypes/16"
			})) as CheckBox;
			this.FORT_BATTLE_2_checkbox.addEventListener(MouseEvent.CLICK,this.FORT_BATTLE_2_changed);
			this.RANKED_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":285,
			"selected":this.RANKED,
			"label":"#menu:loading/battleTypes/17"
			})) as CheckBox;
			this.RANKED_checkbox.addEventListener(MouseEvent.CLICK,this.RANKED_changed);
			this.EPIC_RANDOM_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":310,
			"selected":this.EPIC_RANDOM,
			"label":"#menu:bonusType/24"
			})) as CheckBox;
			this.EPIC_RANDOM_checkbox.addEventListener(MouseEvent.CLICK,this.EPIC_RANDOM_changed);
			this.EPIC_RANDOM_TRAINING_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":335,
			"selected":this.EPIC_RANDOM_TRAINING,
			"label":"#menu:loading/battleTypes/20"
			})) as CheckBox;
			this.EPIC_RANDOM_TRAINING_checkbox.textColor = 0xFF0000;
			this.EPIC_RANDOM_TRAINING_checkbox.toolTip = tooltipText;
			//this.EPIC_RANDOM_TRAINING_checkbox.infoIcoType = !!tooltipText?InfoIcon.TYPE_INFO:"AAA";
			this.EPIC_RANDOM_TRAINING_checkbox.addEventListener(MouseEvent.ROLL_OVER, onControlOver);
			this.EPIC_RANDOM_TRAINING_checkbox.addEventListener(MouseEvent.ROLL_OUT, onControlOut);
			this.EPIC_RANDOM_TRAINING_checkbox.addEventListener(MouseEvent.CLICK,this.EPIC_RANDOM_TRAINING_changed);
			this.EPIC_BATTLE_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":360,
			"selected":this.EPIC_BATTLE,
			"label":"#menu:loading/battleTypes/21"
			})) as CheckBox;
			this.EPIC_BATTLE_checkbox.addEventListener(MouseEvent.CLICK,this.EPIC_BATTLE_changed);
			this.EPIC_TRAINING_checkbox = (this as UIComponent).addChild(App.utils.classFactory.getComponent("CheckBox", CheckBox, {
			"x":40,
			"y":385,
			"selected":this.EPIC_TRAINING,
			"label":"#menu:loading/battleTypes/22"
			})) as CheckBox;
			this.EPIC_TRAINING_checkbox.textColor = 0xFF0000;
			this.EPIC_TRAINING_checkbox.toolTip = tooltipText2;
			//this.EPIC_TRAINING_checkbox.infoIcoType = !!tooltipText2?InfoIcon.TYPE_INFO:"AAA";
			this.EPIC_TRAINING_checkbox.addEventListener(MouseEvent.ROLL_OVER, onControlOver2);
			this.EPIC_TRAINING_checkbox.addEventListener(MouseEvent.ROLL_OUT, onControlOut2);
			this.EPIC_TRAINING_checkbox.addEventListener(MouseEvent.CLICK, this.EPIC_TRAINING_changed);
			this.soundButtonOk = (this as UIComponent).addChild(App.utils.classFactory.getComponent("ButtonRed",SoundButton,{
            "width":120,
            "height":25,
            "x":40,
            "y":420,
            "label":"#dialogs:graphicsChangeConfirmation/submit"
         })) as SoundButton;
         this.soundButtonOk.addEventListener(MouseEvent.CLICK,this.OkClick);
         this.soundButtonCancel = (this as UIComponent).addChild(App.utils.classFactory.getComponent("ButtonBlack",SoundButton,{
            "width":120,
            "height":25,
            "x":180,
            "y":420,
            "label":"#dialogs:common/error/cancel"
         })) as SoundButton;
         this.soundButtonCancel.addEventListener(MouseEvent.CLICK,this.CancelClick);
         this.savetext = new TextField();
         this.savetext.x = 80;
         this.savetext.y = 220;
         this.savetext.width = 170;
         this.savetext.height = 30;
         this.savetext.multiline = false;
         this.savetext.wordWrap = false;
         this.savetext.selectable = false;
         this.savetext.visible = false;
         this.savetext.background = true;
         this.savetext.backgroundColor = 1512977;
         this.savetext.border = true;
         this.savetext.borderColor = 3816245;
         this.savetext.htmlText = this.htmltranslate("<p align = \"center\"><font color=\"#FF0000\" size=\"28\" face=\"$Titlefont\">_(#event_boards:maintenance/update)</font>");
         this.addChild(this.savetext);
		 this.TipsText = new TextField();
		 this.TipsText.x = 5;
		 this.TipsText.y = 5;
		 this.TipsText.width = 250;
		 this.TipsText.height = 30;
		 this.TipsText.multiline = true;
		 this.TipsText.selectable = false;
		 this.TipsText.htmlText = this.htmltranslate("<p align = \"center\"><font color=\"#FFFFFF\" size=\"22\" face=\"$Titlefont\">_(#settings:game/replayEnabled)</font>");
		addChild(TipsText)
		 }
		//Changed Event
		public function UNKNOWN_changed(event:MouseEvent) : void
      {
         this.UNKNOWN = !this.UNKNOWN;
         this.changed();
      }
      
      public function RANDOM_changed(event:MouseEvent) : void
      {
         this.RANDOM = !this.RANDOM;
         this.changed();
      }
      
      public function TRAINING_changed(event:MouseEvent) : void
      {
         this.TRAINING = !this.TRAINING;
         this.changed();
      }
      
      public function CYBERSPORT_changed(event:MouseEvent) : void
      {
         this.CYBERSPORT = !this.CYBERSPORT;
         this.changed();
      }
      
      public function FALLOUT_changed(event:MouseEvent) : void
      {
         this.FALLOUT = !this.FALLOUT;
         this.changed();
      }
	  public function EVENT_BATTLES_changed(event:MouseEvent) : void
      {
         this.EVENT_BATTLES = !this.EVENT_BATTLES;
         this.changed();
      }
      
      public function FALLOUT_CLASSIC_changed(event:MouseEvent) : void
      {
         this.FALLOUT_CLASSIC = !this.FALLOUT_CLASSIC;
         this.changed();
      }
      
      public function FALLOUT_MULTITEAM_changed(event:MouseEvent) : void
      {
         this.FALLOUT_MULTITEAM = !this.FALLOUT_MULTITEAM;
         this.changed();
      }
      
      public function SORTIE_2_changed(event:MouseEvent) : void
      {
         this.SORTIE_2 = !this.SORTIE_2;
         this.changed();
      }
      
      public function FORT_BATTLE_2_changed(event:MouseEvent) : void
      {
         this.FORT_BATTLE_2 = !this.FORT_BATTLE_2;
         this.changed();
      }
	  public function RANKED_changed(event:MouseEvent) : void
      {
         this.RANKED = !this.RANKED;
         this.changed();
      }
      
      public function EPIC_RANDOM_changed(event:MouseEvent) : void
      {
         this.EPIC_RANDOM = !this.EPIC_RANDOM;
         this.changed();
      }
      
      public function EPIC_RANDOM_TRAINING_changed(event:MouseEvent) : void
      {
         this.EPIC_RANDOM_TRAINING = !this.EPIC_RANDOM_TRAINING;
         this.changed();
      }
      
      public function EPIC_BATTLE_changed(event:MouseEvent) : void
      {
         this.EPIC_BATTLE = !this.EPIC_BATTLE;
         this.changed();
      }
      
      public function EPIC_TRAINING_changed(event:MouseEvent) : void
      {
         this.EPIC_TRAINING = !this.EPIC_TRAINING;
         this.changed();
      }
	  
	  public function onControlOut(e : MouseEvent) : void
	{
    App.toolTipMgr.hide();
	}
      
		public function onControlOver(e : MouseEvent):void
	{
    App.toolTipMgr.show(tooltipText);
	}
	
    public function onControlOut2(e : MouseEvent) : void
	{
    App.toolTipMgr.hide();
	}
      
		public function onControlOver2(e : MouseEvent):void
	{
    App.toolTipMgr.show(tooltipText2);
	}  
      
      public function changed() : void
      {
         this.as_data_changed(this.UNKNOWN,this.RANDOM,this.TRAINING,this.CYBERSPORT,this.FALLOUT,this.EVENT_BATTLES,this.FALLOUT_CLASSIC,this.FALLOUT_MULTITEAM,this.SORTIE_2,this.FORT_BATTLE_2,this.RANKED,this.EPIC_RANDOM,this.EPIC_RANDOM_TRAINING,this.EPIC_BATTLE,this.EPIC_TRAINING);
      }
	 public function OkClick() : void
      {
         this.as_okClicked();
         this.savetext.visible = true;
		 this.timer = new Timer(1500, 1);
		 this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.hidesave);
		 this.timer.start();
      }
      
      public function hidesave() : void
      {
         this.savetext.visible = false;
      }
      
      public function CancelClick() : void
      {
         this.as_cancelClicked();
         this.onWindowClose();
      }
      public function as_senddata(UNKNOWN:Boolean, RANDOM:Boolean, TRAINING:Boolean, CYBERSPORT:Boolean, FALLOUT:Boolean, EVENT_BATTLES:Boolean, FALLOUT_CLASSIC:Boolean, FALLOUT_MULTITEAM:Boolean, SORTIE_2:Boolean, FORT_BATTLE_2:Boolean, RANKED:Boolean, EPIC_RANDOM:Boolean, EPIC_RANDOM_TRAINING:Boolean, EPIC_BATTLE:Boolean, EPIC_TRAINING:Boolean) : void
      {
         this.UNKNOWN = UNKNOWN;
		 this.UNKNOWN_checkbox.selected = this.UNKNOWN;
		 this.RANDOM = RANDOM;
		 this.RANDOM_checkbox.selected = this.RANDOM;
		 this.TRAINING = TRAINING;
		 this.TRAINING_checkbox.selected = this.TRAINING;
		 this.CYBERSPORT = CYBERSPORT;
		 this.CYBERSPORT_checkbox.selected = this.CYBERSPORT;
		 this.FALLOUT = FALLOUT;
		 this.FALLOUT_checkbox.selected = this.FALLOUT;
		 this.EVENT_BATTLES = EVENT_BATTLES;
		 this.EVENT_BATTLES_checkbox.selected = this.EVENT_BATTLES;
		 this.FALLOUT_CLASSIC = FALLOUT_CLASSIC;
		 this.FALLOUT_CLASSIC_checkbox.selected = this.FALLOUT_CLASSIC;
		this.FALLOUT_MULTITEAM = FALLOUT_MULTITEAM;
		this.FALLOUT_MULTITEAM_checkbox.selected = this.FALLOUT_MULTITEAM;
		this.SORTIE_2 = SORTIE_2;
		this.SORTIE_2_checkbox.selected = this.SORTIE_2;
		this.FORT_BATTLE_2 = FORT_BATTLE_2;
		this.FORT_BATTLE_2_checkbox.selected = this.FORT_BATTLE_2;
		this.RANKED = RANKED;
		this.RANKED_checkbox.selected = RANKED;
		this.EPIC_RANDOM = EPIC_RANDOM;
		this.EPIC_RANDOM_checkbox.selected = this.EPIC_RANDOM;
		this.EPIC_RANDOM_TRAINING = EPIC_RANDOM_TRAINING;
		this.EPIC_RANDOM_TRAINING_checkbox.selected = this.EPIC_RANDOM_TRAINING;
		this.EPIC_BATTLE = EPIC_BATTLE;
		this.EPIC_BATTLE_checkbox.selected = this.EPIC_BATTLE;
		this.EPIC_TRAINING = EPIC_TRAINING;
		this.EPIC_TRAINING_checkbox.selected = this.EPIC_TRAINING;
      }
	}
	
}
