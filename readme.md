# Joybox - Box2D [![Build Status](https://travis-ci.org/CurveBeryl/Joybox-Box2D.png?branch=master)](https://travis-ci.org/CurveBeryl/Joybox-Box2D)
Box2D Objective-C wrapper for Joybox and [RubyMotion](http://www.rubymotion.com)

For more information about Joybox, please visit: [joybox.io](http://joybox.io) or the main repository [Joybox](https://github.com/rubymotion/Joybox)

## Features Supported
* World
* Body
* All Shapes
* World Listeners

## Features in Construction
* Joints
* Contacts

If a feature is missing please write a post on the project's [Google Group](https://groups.google.com/forum/?fromgroups#!forum/joybox-wrapper)

## Generate BridgeSupport File

For generating the bridgesupport please do the following in the headers folder of the static library:

```
# For iOS
gen_bridge_metadata -F complete --no-64-bit -c '-I.' *.h -o bridgeSupport.bridgesupport	

# For OSX
gen_bridge_metadata -F complete -c '-I.' *.h -o bridgeSupport.bridgesupport
```


## Feedback and Help
For questions and feedback use the project's [Google Group](https://groups.google.com/forum/?fromgroups#!forum/joybox-wrapper)

For bug reports use the project's [Issue Tracker](https://github.com/rubymotion/Joybox/issues).

## Contributions

If you wish to help us to stop the madness, there are some ways you can do it:

* Joybox Wrapper (Ruby): [Joybox](https://github.com/rubymotion/Joybox)
* Box2D Wrapper (C++): This repository ;)
* Documentation (markdown): [Joybox - Documentation](https://github.com/CurveBeryl/Joybox-Documentation) 

To contribute just:

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Joybox - Box2D is released under the MIT License.
 

## Authors

**Box2D**: Erin Catto [Box2D | A 2D Physics Engine for Games](http://box2d.org)

**Joybox - Box2D**: [Juan José Karam](https://github.com/CurveBeryl) [@JuanKaram](https://twitter.com/JuanKaram) and [Gabriel Sosa](https://github.com/mexinsane) [@mexinsane](https://twitter.com/mexinsane) and contributors